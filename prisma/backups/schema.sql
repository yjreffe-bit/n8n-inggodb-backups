


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."increment_workflow_version"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
			BEGIN
				IF NEW."versionCounter" IS NOT DISTINCT FROM OLD."versionCounter" THEN
					NEW."versionCounter" = OLD."versionCounter" + 1;
				END IF;
				RETURN NEW;
			END;
			$$;


ALTER FUNCTION "public"."increment_workflow_version"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."rls_auto_enable"() RETURNS "event_trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'pg_catalog'
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN
    SELECT *
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
      AND object_type IN ('table','partitioned table')
  LOOP
     IF cmd.schema_name IS NOT NULL AND cmd.schema_name IN ('public') AND cmd.schema_name NOT IN ('pg_catalog','information_schema') AND cmd.schema_name NOT LIKE 'pg_toast%' AND cmd.schema_name NOT LIKE 'pg_temp%' THEN
      BEGIN
        EXECUTE format('alter table if exists %s enable row level security', cmd.object_identity);
        RAISE LOG 'rls_auto_enable: enabled RLS on %', cmd.object_identity;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE LOG 'rls_auto_enable: failed to enable RLS on %', cmd.object_identity;
      END;
     ELSE
        RAISE LOG 'rls_auto_enable: skip % (either system schema or not in enforced list: %.)', cmd.object_identity, cmd.schema_name;
     END IF;
  END LOOP;
END;
$$;


ALTER FUNCTION "public"."rls_auto_enable"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."ai_builder_temporary_workflow" (
    "workflowId" character varying(36) NOT NULL,
    "threadId" "uuid" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."ai_builder_temporary_workflow" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."annotation_tag_entity" (
    "id" character varying(16) NOT NULL,
    "name" character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."annotation_tag_entity" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."auth_identity" (
    "userId" "uuid",
    "providerId" character varying(255) NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."auth_identity" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."auth_provider_sync_history" (
    "id" integer NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "runMode" "text" NOT NULL,
    "status" "text" NOT NULL,
    "startedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "scanned" integer NOT NULL,
    "created" integer NOT NULL,
    "updated" integer NOT NULL,
    "disabled" integer NOT NULL,
    "error" "text"
);


ALTER TABLE "public"."auth_provider_sync_history" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."auth_provider_sync_history_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."auth_provider_sync_history_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."auth_provider_sync_history_id_seq" OWNED BY "public"."auth_provider_sync_history"."id";



CREATE TABLE IF NOT EXISTS "public"."binary_data" (
    "fileId" "uuid" NOT NULL,
    "sourceType" character varying(50) NOT NULL,
    "sourceId" character varying(255) NOT NULL,
    "data" "bytea" NOT NULL,
    "mimeType" character varying(255),
    "fileName" character varying(255),
    "fileSize" integer NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    CONSTRAINT "CHK_binary_data_sourceType" CHECK ((("sourceType")::"text" = ANY ((ARRAY['execution'::character varying, 'chat_message_attachment'::character varying])::"text"[])))
);


ALTER TABLE "public"."binary_data" OWNER TO "postgres";


COMMENT ON COLUMN "public"."binary_data"."sourceType" IS 'Source the file belongs to, e.g. ''execution''';



COMMENT ON COLUMN "public"."binary_data"."sourceId" IS 'ID of the source, e.g. execution ID';



COMMENT ON COLUMN "public"."binary_data"."data" IS 'Raw, not base64 encoded';



COMMENT ON COLUMN "public"."binary_data"."fileSize" IS 'In bytes';



CREATE TABLE IF NOT EXISTS "public"."chat_hub_agent_tools" (
    "agentId" "uuid" NOT NULL,
    "toolId" "uuid" NOT NULL
);


ALTER TABLE "public"."chat_hub_agent_tools" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chat_hub_agents" (
    "id" "uuid" NOT NULL,
    "name" character varying(256) NOT NULL,
    "description" character varying(512),
    "systemPrompt" "text" NOT NULL,
    "ownerId" "uuid" NOT NULL,
    "credentialId" character varying(36),
    "provider" character varying(16) NOT NULL,
    "model" character varying(64) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "icon" json,
    "files" json DEFAULT '[]'::json NOT NULL,
    "suggestedPrompts" json DEFAULT '[]'::json NOT NULL
);


ALTER TABLE "public"."chat_hub_agents" OWNER TO "postgres";


COMMENT ON COLUMN "public"."chat_hub_agents"."provider" IS 'ChatHubProvider enum: "openai", "anthropic", "google", "n8n"';



COMMENT ON COLUMN "public"."chat_hub_agents"."model" IS 'Model name used at the respective Model node, ie. "gpt-4"';



CREATE TABLE IF NOT EXISTS "public"."chat_hub_messages" (
    "id" "uuid" NOT NULL,
    "sessionId" "uuid" NOT NULL,
    "previousMessageId" "uuid",
    "revisionOfMessageId" "uuid",
    "retryOfMessageId" "uuid",
    "type" character varying(16) NOT NULL,
    "name" character varying(128) NOT NULL,
    "content" "text" NOT NULL,
    "provider" character varying(16),
    "model" character varying(256),
    "workflowId" character varying(36),
    "executionId" integer,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "agentId" "uuid",
    "status" character varying(16) DEFAULT 'success'::character varying NOT NULL,
    "attachments" json
);


ALTER TABLE "public"."chat_hub_messages" OWNER TO "postgres";


COMMENT ON COLUMN "public"."chat_hub_messages"."type" IS 'ChatHubMessageType enum: "human", "ai", "system", "tool", "generic"';



COMMENT ON COLUMN "public"."chat_hub_messages"."provider" IS 'ChatHubProvider enum: "openai", "anthropic", "google", "n8n"';



COMMENT ON COLUMN "public"."chat_hub_messages"."model" IS 'Model name used at the respective Model node, ie. "gpt-4"';



COMMENT ON COLUMN "public"."chat_hub_messages"."agentId" IS 'ID of the custom agent (if provider is "custom-agent")';



COMMENT ON COLUMN "public"."chat_hub_messages"."status" IS 'ChatHubMessageStatus enum, eg. "success", "error", "running", "cancelled"';



COMMENT ON COLUMN "public"."chat_hub_messages"."attachments" IS 'File attachments for the message (if any), stored as JSON. Files are stored as base64-encoded data URLs.';



CREATE TABLE IF NOT EXISTS "public"."chat_hub_session_tools" (
    "sessionId" "uuid" NOT NULL,
    "toolId" "uuid" NOT NULL
);


ALTER TABLE "public"."chat_hub_session_tools" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chat_hub_sessions" (
    "id" "uuid" NOT NULL,
    "title" character varying(256) NOT NULL,
    "ownerId" "uuid" NOT NULL,
    "lastMessageAt" timestamp(3) with time zone NOT NULL,
    "credentialId" character varying(36),
    "provider" character varying(16),
    "model" character varying(256),
    "workflowId" character varying(36),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "agentId" "uuid",
    "agentName" character varying(128),
    "type" character varying(16) DEFAULT 'production'::character varying NOT NULL,
    CONSTRAINT "CHK_chat_hub_sessions_type" CHECK ((("type")::"text" = ANY ((ARRAY['production'::character varying, 'manual'::character varying])::"text"[])))
);


ALTER TABLE "public"."chat_hub_sessions" OWNER TO "postgres";


COMMENT ON COLUMN "public"."chat_hub_sessions"."provider" IS 'ChatHubProvider enum: "openai", "anthropic", "google", "n8n"';



COMMENT ON COLUMN "public"."chat_hub_sessions"."model" IS 'Model name used at the respective Model node, ie. "gpt-4"';



COMMENT ON COLUMN "public"."chat_hub_sessions"."agentId" IS 'ID of the custom agent (if provider is "custom-agent")';



COMMENT ON COLUMN "public"."chat_hub_sessions"."agentName" IS 'Cached name of the custom agent (if provider is "custom-agent")';



CREATE TABLE IF NOT EXISTS "public"."chat_hub_tools" (
    "id" "uuid" NOT NULL,
    "name" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "typeVersion" double precision NOT NULL,
    "ownerId" "uuid" NOT NULL,
    "definition" json NOT NULL,
    "enabled" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."chat_hub_tools" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."credential_dependency" (
    "id" integer NOT NULL,
    "credentialId" character varying(36) NOT NULL,
    "dependencyType" character varying(64) NOT NULL,
    "dependencyId" character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."credential_dependency" OWNER TO "postgres";


ALTER TABLE "public"."credential_dependency" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."credential_dependency_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."credentials_entity" (
    "name" character varying(128) NOT NULL,
    "data" "text" NOT NULL,
    "type" character varying(128) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "id" character varying(36) NOT NULL,
    "isManaged" boolean DEFAULT false NOT NULL,
    "isGlobal" boolean DEFAULT false NOT NULL,
    "isResolvable" boolean DEFAULT false NOT NULL,
    "resolvableAllowFallback" boolean DEFAULT false NOT NULL,
    "resolverId" character varying(16)
);


ALTER TABLE "public"."credentials_entity" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."data_table" (
    "id" character varying(36) NOT NULL,
    "name" character varying(128) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."data_table" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."data_table_column" (
    "id" character varying(36) NOT NULL,
    "name" character varying(128) NOT NULL,
    "type" character varying(32) NOT NULL,
    "index" integer NOT NULL,
    "dataTableId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."data_table_column" OWNER TO "postgres";


COMMENT ON COLUMN "public"."data_table_column"."type" IS 'Expected: string, number, boolean, or date (not enforced as a constraint)';



COMMENT ON COLUMN "public"."data_table_column"."index" IS 'Column order, starting from 0 (0 = first column)';



CREATE TABLE IF NOT EXISTS "public"."deployment_key" (
    "id" character varying(36) NOT NULL,
    "type" character varying(64) NOT NULL,
    "value" "text" NOT NULL,
    "algorithm" character varying(20),
    "status" character varying(20) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."deployment_key" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."dynamic_credential_entry" (
    "credential_id" character varying(16) NOT NULL,
    "subject_id" character varying(2048) NOT NULL,
    "resolver_id" character varying(16) NOT NULL,
    "data" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."dynamic_credential_entry" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."dynamic_credential_resolver" (
    "id" character varying(16) NOT NULL,
    "name" character varying(128) NOT NULL,
    "type" character varying(128) NOT NULL,
    "config" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."dynamic_credential_resolver" OWNER TO "postgres";


COMMENT ON COLUMN "public"."dynamic_credential_resolver"."config" IS 'Encrypted resolver configuration (JSON encrypted as string)';



CREATE TABLE IF NOT EXISTS "public"."dynamic_credential_user_entry" (
    "credentialId" character varying(16) NOT NULL,
    "userId" "uuid" NOT NULL,
    "resolverId" character varying(16) NOT NULL,
    "data" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."dynamic_credential_user_entry" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."event_destinations" (
    "id" "uuid" NOT NULL,
    "destination" "jsonb" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."event_destinations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."execution_annotation_tags" (
    "annotationId" integer NOT NULL,
    "tagId" character varying(24) NOT NULL
);


ALTER TABLE "public"."execution_annotation_tags" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."execution_annotations" (
    "id" integer NOT NULL,
    "executionId" integer NOT NULL,
    "vote" character varying(6),
    "note" "text",
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."execution_annotations" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."execution_annotations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."execution_annotations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."execution_annotations_id_seq" OWNED BY "public"."execution_annotations"."id";



CREATE TABLE IF NOT EXISTS "public"."execution_data" (
    "executionId" integer NOT NULL,
    "workflowData" json NOT NULL,
    "data" "text" NOT NULL,
    "workflowVersionId" character varying(36)
);


ALTER TABLE "public"."execution_data" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."execution_entity" (
    "id" integer NOT NULL,
    "finished" boolean NOT NULL,
    "mode" character varying NOT NULL,
    "retryOf" character varying,
    "retrySuccessId" character varying,
    "startedAt" timestamp(3) with time zone,
    "stoppedAt" timestamp(3) with time zone,
    "waitTill" timestamp(3) with time zone,
    "status" character varying NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "deletedAt" timestamp(3) with time zone,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "storedAt" character varying(2) DEFAULT 'db'::character varying NOT NULL,
    CONSTRAINT "execution_entity_storedAt_check" CHECK ((("storedAt")::"text" = ANY ((ARRAY['db'::character varying, 'fs'::character varying, 's3'::character varying])::"text"[])))
);


ALTER TABLE "public"."execution_entity" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."execution_entity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."execution_entity_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."execution_entity_id_seq" OWNED BY "public"."execution_entity"."id";



CREATE TABLE IF NOT EXISTS "public"."execution_metadata" (
    "id" integer NOT NULL,
    "executionId" integer NOT NULL,
    "key" character varying(255) NOT NULL,
    "value" "text" NOT NULL
);


ALTER TABLE "public"."execution_metadata" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."execution_metadata_temp_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."execution_metadata_temp_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."execution_metadata_temp_id_seq" OWNED BY "public"."execution_metadata"."id";



CREATE TABLE IF NOT EXISTS "public"."folder" (
    "id" character varying(36) NOT NULL,
    "name" character varying(128) NOT NULL,
    "parentFolderId" character varying(36),
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."folder" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."folder_tag" (
    "folderId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE "public"."folder_tag" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."insights_by_period" (
    "id" integer NOT NULL,
    "metaId" integer NOT NULL,
    "type" integer NOT NULL,
    "value" bigint NOT NULL,
    "periodUnit" integer NOT NULL,
    "periodStart" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "public"."insights_by_period" OWNER TO "postgres";


COMMENT ON COLUMN "public"."insights_by_period"."type" IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';



COMMENT ON COLUMN "public"."insights_by_period"."periodUnit" IS '0: hour, 1: day, 2: week';



ALTER TABLE "public"."insights_by_period" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."insights_by_period_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."insights_metadata" (
    "metaId" integer NOT NULL,
    "workflowId" character varying(36),
    "projectId" character varying(36),
    "workflowName" character varying(128) NOT NULL,
    "projectName" character varying(255) NOT NULL
);


ALTER TABLE "public"."insights_metadata" OWNER TO "postgres";


ALTER TABLE "public"."insights_metadata" ALTER COLUMN "metaId" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."insights_metadata_metaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."insights_raw" (
    "id" integer NOT NULL,
    "metaId" integer NOT NULL,
    "type" integer NOT NULL,
    "value" bigint NOT NULL,
    "timestamp" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."insights_raw" OWNER TO "postgres";


COMMENT ON COLUMN "public"."insights_raw"."type" IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';



ALTER TABLE "public"."insights_raw" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."insights_raw_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."installed_nodes" (
    "name" character varying(200) NOT NULL,
    "type" character varying(200) NOT NULL,
    "latestVersion" integer DEFAULT 1 NOT NULL,
    "package" character varying(241) NOT NULL
);


ALTER TABLE "public"."installed_nodes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."installed_packages" (
    "packageName" character varying(214) NOT NULL,
    "installedVersion" character varying(50) NOT NULL,
    "authorName" character varying(70),
    "authorEmail" character varying(70),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."installed_packages" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_iteration_logs" (
    "id" character varying(36) NOT NULL,
    "threadId" "uuid" NOT NULL,
    "taskKey" character varying NOT NULL,
    "entry" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_iteration_logs" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_messages" (
    "id" character varying(36) NOT NULL,
    "threadId" "uuid" NOT NULL,
    "content" "text" NOT NULL,
    "role" character varying(16) NOT NULL,
    "type" character varying(32),
    "resourceId" character varying(255),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_messages" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_observational_memory" (
    "id" character varying(36) NOT NULL,
    "lookupKey" character varying(255) NOT NULL,
    "scope" character varying(16) NOT NULL,
    "threadId" "uuid",
    "resourceId" character varying(255) NOT NULL,
    "activeObservations" "text" DEFAULT ''::"text" NOT NULL,
    "originType" character varying(32) NOT NULL,
    "config" "text" NOT NULL,
    "generationCount" integer DEFAULT 0 NOT NULL,
    "lastObservedAt" timestamp(3) with time zone,
    "pendingMessageTokens" integer DEFAULT 0 NOT NULL,
    "totalTokensObserved" integer DEFAULT 0 NOT NULL,
    "observationTokenCount" integer DEFAULT 0 NOT NULL,
    "isObserving" boolean DEFAULT false NOT NULL,
    "isReflecting" boolean DEFAULT false NOT NULL,
    "observedMessageIds" json,
    "observedTimezone" character varying,
    "bufferedObservations" "text",
    "bufferedObservationTokens" integer,
    "bufferedMessageIds" json,
    "bufferedReflection" "text",
    "bufferedReflectionTokens" integer,
    "bufferedReflectionInputTokens" integer,
    "reflectedObservationLineCount" integer,
    "bufferedObservationChunks" json,
    "isBufferingObservation" boolean DEFAULT false NOT NULL,
    "isBufferingReflection" boolean DEFAULT false NOT NULL,
    "lastBufferedAtTokens" integer DEFAULT 0 NOT NULL,
    "lastBufferedAtTime" timestamp(3) with time zone,
    "metadata" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_observational_memory" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_resources" (
    "id" character varying(255) NOT NULL,
    "workingMemory" "text",
    "metadata" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_resources" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_run_snapshots" (
    "threadId" "uuid" NOT NULL,
    "runId" character varying(36) NOT NULL,
    "messageGroupId" character varying(36),
    "runIds" json,
    "tree" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_run_snapshots" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_threads" (
    "id" "uuid" NOT NULL,
    "resourceId" character varying(255) NOT NULL,
    "title" "text" DEFAULT ''::"text" NOT NULL,
    "metadata" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_threads" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_ai_workflow_snapshots" (
    "runId" character varying(36) NOT NULL,
    "workflowName" character varying(255) NOT NULL,
    "resourceId" character varying(255),
    "status" character varying,
    "snapshot" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_ai_workflow_snapshots" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."instance_version_history" (
    "id" integer NOT NULL,
    "major" integer NOT NULL,
    "minor" integer NOT NULL,
    "patch" integer NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."instance_version_history" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."instance_version_history_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."instance_version_history_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."instance_version_history_id_seq" OWNED BY "public"."instance_version_history"."id";



CREATE TABLE IF NOT EXISTS "public"."invalid_auth_token" (
    "token" character varying(512) NOT NULL,
    "expiresAt" timestamp(3) with time zone NOT NULL
);


ALTER TABLE "public"."invalid_auth_token" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."migrations" (
    "id" integer NOT NULL,
    "timestamp" bigint NOT NULL,
    "name" character varying NOT NULL
);


ALTER TABLE "public"."migrations" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."migrations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."migrations_id_seq" OWNED BY "public"."migrations"."id";



CREATE TABLE IF NOT EXISTS "public"."oauth_access_tokens" (
    "token" character varying NOT NULL,
    "clientId" character varying NOT NULL,
    "userId" "uuid" NOT NULL
);


ALTER TABLE "public"."oauth_access_tokens" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."oauth_authorization_codes" (
    "code" character varying(255) NOT NULL,
    "clientId" character varying NOT NULL,
    "userId" "uuid" NOT NULL,
    "redirectUri" character varying NOT NULL,
    "codeChallenge" character varying NOT NULL,
    "codeChallengeMethod" character varying(255) NOT NULL,
    "expiresAt" bigint NOT NULL,
    "state" character varying,
    "used" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."oauth_authorization_codes" OWNER TO "postgres";


COMMENT ON COLUMN "public"."oauth_authorization_codes"."expiresAt" IS 'Unix timestamp in milliseconds';



CREATE TABLE IF NOT EXISTS "public"."oauth_clients" (
    "id" character varying NOT NULL,
    "name" character varying(255) NOT NULL,
    "redirectUris" json NOT NULL,
    "grantTypes" json NOT NULL,
    "clientSecret" character varying(255),
    "clientSecretExpiresAt" bigint,
    "tokenEndpointAuthMethod" character varying(255) DEFAULT 'none'::character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."oauth_clients" OWNER TO "postgres";


COMMENT ON COLUMN "public"."oauth_clients"."tokenEndpointAuthMethod" IS 'Possible values: none, client_secret_basic or client_secret_post';



CREATE TABLE IF NOT EXISTS "public"."oauth_refresh_tokens" (
    "token" character varying(255) NOT NULL,
    "clientId" character varying NOT NULL,
    "userId" "uuid" NOT NULL,
    "expiresAt" bigint NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."oauth_refresh_tokens" OWNER TO "postgres";


COMMENT ON COLUMN "public"."oauth_refresh_tokens"."expiresAt" IS 'Unix timestamp in milliseconds';



CREATE TABLE IF NOT EXISTS "public"."oauth_user_consents" (
    "id" integer NOT NULL,
    "userId" "uuid" NOT NULL,
    "clientId" character varying NOT NULL,
    "grantedAt" bigint NOT NULL
);


ALTER TABLE "public"."oauth_user_consents" OWNER TO "postgres";


COMMENT ON COLUMN "public"."oauth_user_consents"."grantedAt" IS 'Unix timestamp in milliseconds';



ALTER TABLE "public"."oauth_user_consents" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."oauth_user_consents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."processed_data" (
    "workflowId" character varying(36) NOT NULL,
    "context" character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "value" "text" NOT NULL
);


ALTER TABLE "public"."processed_data" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."project" (
    "id" character varying(36) NOT NULL,
    "name" character varying(255) NOT NULL,
    "type" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "icon" json,
    "description" character varying(512),
    "creatorId" "uuid"
);


ALTER TABLE "public"."project" OWNER TO "postgres";


COMMENT ON COLUMN "public"."project"."creatorId" IS 'ID of the user who created the project';



CREATE TABLE IF NOT EXISTS "public"."project_relation" (
    "projectId" character varying(36) NOT NULL,
    "userId" "uuid" NOT NULL,
    "role" character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."project_relation" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."project_secrets_provider_access" (
    "secretsProviderConnectionId" integer NOT NULL,
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "role" character varying(128) DEFAULT 'secretsProviderConnection:user'::character varying NOT NULL,
    CONSTRAINT "CHK_project_secrets_provider_access_role" CHECK ((("role")::"text" = ANY ((ARRAY['secretsProviderConnection:owner'::character varying, 'secretsProviderConnection:user'::character varying])::"text"[])))
);


ALTER TABLE "public"."project_secrets_provider_access" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."role" (
    "slug" character varying(128) NOT NULL,
    "displayName" "text",
    "description" "text",
    "roleType" "text",
    "systemRole" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."role" OWNER TO "postgres";


COMMENT ON COLUMN "public"."role"."slug" IS 'Unique identifier of the role for example: "global:owner"';



COMMENT ON COLUMN "public"."role"."displayName" IS 'Name used to display in the UI';



COMMENT ON COLUMN "public"."role"."description" IS 'Text describing the scope in more detail of users';



COMMENT ON COLUMN "public"."role"."roleType" IS 'Type of the role, e.g., global, project, or workflow';



COMMENT ON COLUMN "public"."role"."systemRole" IS 'Indicates if the role is managed by the system and cannot be edited';



CREATE TABLE IF NOT EXISTS "public"."role_mapping_rule" (
    "id" character varying(16) NOT NULL,
    "expression" "text" NOT NULL,
    "role" character varying(128) NOT NULL,
    "type" character varying(64) NOT NULL,
    "order" integer NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."role_mapping_rule" OWNER TO "postgres";


COMMENT ON COLUMN "public"."role_mapping_rule"."type" IS 'Expected values: ''instance'' (maps to a global role) or ''project'' (maps to a project role; projects linked via role_mapping_rule_project).';



CREATE TABLE IF NOT EXISTS "public"."role_mapping_rule_project" (
    "roleMappingRuleId" character varying(16) NOT NULL,
    "projectId" character varying(36) NOT NULL
);


ALTER TABLE "public"."role_mapping_rule_project" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."role_scope" (
    "roleSlug" character varying(128) NOT NULL,
    "scopeSlug" character varying(128) NOT NULL
);


ALTER TABLE "public"."role_scope" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."scope" (
    "slug" character varying(128) NOT NULL,
    "displayName" "text",
    "description" "text"
);


ALTER TABLE "public"."scope" OWNER TO "postgres";


COMMENT ON COLUMN "public"."scope"."slug" IS 'Unique identifier of the scope for example: "project:create"';



COMMENT ON COLUMN "public"."scope"."displayName" IS 'Name used to display in the UI';



COMMENT ON COLUMN "public"."scope"."description" IS 'Text describing the scope in more detail of users';



CREATE TABLE IF NOT EXISTS "public"."secrets_provider_connection" (
    "id" integer NOT NULL,
    "providerKey" character varying(128) NOT NULL,
    "type" character varying(36) NOT NULL,
    "encryptedSettings" "text" NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."secrets_provider_connection" OWNER TO "postgres";


COMMENT ON COLUMN "public"."secrets_provider_connection"."type" IS 'Type of secrets provider. Possible values: awsSecretsManager, gcpSecretsManager, vault, azureKeyVault, infisical';



ALTER TABLE "public"."secrets_provider_connection" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."secrets_provider_connection_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."settings" (
    "key" character varying(255) NOT NULL,
    "value" "text" NOT NULL,
    "loadOnStartup" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."settings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."shared_credentials" (
    "credentialsId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    "role" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."shared_credentials" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."shared_workflow" (
    "workflowId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    "role" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."shared_workflow" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tag_entity" (
    "name" character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "id" character varying(36) NOT NULL
);


ALTER TABLE "public"."tag_entity" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."test_case_execution" (
    "id" character varying(36) NOT NULL,
    "testRunId" character varying(36) NOT NULL,
    "executionId" integer,
    "status" character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    "errorCode" character varying,
    "errorDetails" json,
    "metrics" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "inputs" json,
    "outputs" json
);


ALTER TABLE "public"."test_case_execution" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."test_run" (
    "id" character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "status" character varying NOT NULL,
    "errorCode" character varying,
    "errorDetails" json,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    "metrics" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "runningInstanceId" character varying(255),
    "cancelRequested" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."test_run" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."token_exchange_jti" (
    "jti" character varying(255) NOT NULL,
    "expiresAt" timestamp(3) with time zone NOT NULL,
    "createdAt" timestamp(3) with time zone NOT NULL
);


ALTER TABLE "public"."token_exchange_jti" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."trusted_key" (
    "sourceId" character varying(36) NOT NULL,
    "kid" character varying(255) NOT NULL,
    "data" "text" NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."trusted_key" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."trusted_key_source" (
    "id" character varying(36) NOT NULL,
    "type" character varying(32) NOT NULL,
    "config" "text" NOT NULL,
    "status" character varying(32) DEFAULT 'pending'::character varying NOT NULL,
    "lastError" "text",
    "lastRefreshedAt" timestamp(3) with time zone,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."trusted_key_source" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "email" character varying(255),
    "firstName" character varying(32),
    "lastName" character varying(32),
    "password" character varying(255),
    "personalizationAnswers" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "settings" json,
    "disabled" boolean DEFAULT false NOT NULL,
    "mfaEnabled" boolean DEFAULT false NOT NULL,
    "mfaSecret" "text",
    "mfaRecoveryCodes" "text",
    "lastActiveAt" "date",
    "roleSlug" character varying(128) DEFAULT 'global:member'::character varying NOT NULL
);


ALTER TABLE "public"."user" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_api_keys" (
    "id" character varying(36) NOT NULL,
    "userId" "uuid" NOT NULL,
    "label" character varying(100) NOT NULL,
    "apiKey" character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "scopes" json,
    "audience" character varying DEFAULT 'public-api'::character varying NOT NULL
);


ALTER TABLE "public"."user_api_keys" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_favorites" (
    "id" integer NOT NULL,
    "userId" "uuid" NOT NULL,
    "resourceId" character varying(255) NOT NULL,
    "resourceType" character varying(64) NOT NULL
);


ALTER TABLE "public"."user_favorites" OWNER TO "postgres";


ALTER TABLE "public"."user_favorites" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."user_favorites_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."variables" (
    "key" character varying(50) NOT NULL,
    "type" character varying(50) DEFAULT 'string'::character varying NOT NULL,
    "value" character varying(255),
    "id" character varying(36) NOT NULL,
    "projectId" character varying(36)
);


ALTER TABLE "public"."variables" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."webhook_entity" (
    "webhookPath" character varying NOT NULL,
    "method" character varying NOT NULL,
    "node" character varying NOT NULL,
    "webhookId" character varying,
    "pathLength" integer,
    "workflowId" character varying(36) NOT NULL
);


ALTER TABLE "public"."webhook_entity" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."workflow_builder_session" (
    "id" "uuid" NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "userId" "uuid" NOT NULL,
    "messages" json DEFAULT '[]'::json NOT NULL,
    "previousSummary" "text",
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "activeVersionCardId" character varying(255),
    "resumeAfterRestoreMessageId" character varying(255)
);


ALTER TABLE "public"."workflow_builder_session" OWNER TO "postgres";


COMMENT ON COLUMN "public"."workflow_builder_session"."previousSummary" IS 'Summary of prior conversation from compaction (/compact or auto-compact)';



CREATE TABLE IF NOT EXISTS "public"."workflow_dependency" (
    "id" integer NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "workflowVersionId" integer NOT NULL,
    "dependencyType" character varying(32) NOT NULL,
    "dependencyKey" character varying(255) NOT NULL,
    "dependencyInfo" json,
    "indexVersionId" smallint DEFAULT 1 NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "publishedVersionId" character varying(36)
);


ALTER TABLE "public"."workflow_dependency" OWNER TO "postgres";


COMMENT ON COLUMN "public"."workflow_dependency"."workflowVersionId" IS 'Version of the workflow';



COMMENT ON COLUMN "public"."workflow_dependency"."dependencyType" IS 'Type of dependency: "credential", "nodeType", "webhookPath", or "workflowCall"';



COMMENT ON COLUMN "public"."workflow_dependency"."dependencyKey" IS 'ID or name of the dependency';



COMMENT ON COLUMN "public"."workflow_dependency"."dependencyInfo" IS 'Additional info about the dependency, interpreted based on type';



COMMENT ON COLUMN "public"."workflow_dependency"."indexVersionId" IS 'Version of the index structure';



ALTER TABLE "public"."workflow_dependency" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."workflow_dependency_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."workflow_entity" (
    "name" character varying(128) NOT NULL,
    "active" boolean NOT NULL,
    "nodes" json NOT NULL,
    "connections" json NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "settings" json,
    "staticData" json,
    "pinData" json,
    "versionId" character(36) NOT NULL,
    "triggerCount" integer DEFAULT 0 NOT NULL,
    "id" character varying(36) NOT NULL,
    "meta" json,
    "parentFolderId" character varying(36) DEFAULT NULL::character varying,
    "isArchived" boolean DEFAULT false NOT NULL,
    "versionCounter" integer DEFAULT 1 NOT NULL,
    "description" "text",
    "activeVersionId" character varying(36)
);


ALTER TABLE "public"."workflow_entity" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."workflow_history" (
    "versionId" character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "authors" character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "nodes" json NOT NULL,
    "connections" json NOT NULL,
    "name" character varying(128),
    "autosaved" boolean DEFAULT false NOT NULL,
    "description" "text"
);


ALTER TABLE "public"."workflow_history" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."workflow_publish_history" (
    "id" integer NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "versionId" character varying(36),
    "event" character varying(36) NOT NULL,
    "userId" "uuid",
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    CONSTRAINT "CHK_workflow_publish_history_event" CHECK ((("event")::"text" = ANY ((ARRAY['activated'::character varying, 'deactivated'::character varying])::"text"[])))
);


ALTER TABLE "public"."workflow_publish_history" OWNER TO "postgres";


COMMENT ON COLUMN "public"."workflow_publish_history"."event" IS 'Type of history record: activated (workflow is now active), deactivated (workflow is now inactive)';



ALTER TABLE "public"."workflow_publish_history" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."workflow_publish_history_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."workflow_published_version" (
    "workflowId" character varying(36) NOT NULL,
    "publishedVersionId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE "public"."workflow_published_version" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."workflow_statistics" (
    "count" bigint DEFAULT 0,
    "latestEvent" timestamp(3) with time zone,
    "name" character varying(128) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "rootCount" bigint DEFAULT 0,
    "id" integer NOT NULL,
    "workflowName" character varying(128)
);


ALTER TABLE "public"."workflow_statistics" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."workflow_statistics_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."workflow_statistics_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."workflow_statistics_id_seq" OWNED BY "public"."workflow_statistics"."id";



CREATE TABLE IF NOT EXISTS "public"."workflows_tags" (
    "workflowId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE "public"."workflows_tags" OWNER TO "postgres";


ALTER TABLE ONLY "public"."auth_provider_sync_history" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_provider_sync_history_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."execution_annotations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."execution_annotations_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."execution_entity" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."execution_entity_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."execution_metadata" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."execution_metadata_temp_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."instance_version_history" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."instance_version_history_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."migrations_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."workflow_statistics" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."workflow_statistics_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."test_run"
    ADD CONSTRAINT "PK_011c050f566e9db509a0fadb9b9" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."project_secrets_provider_access"
    ADD CONSTRAINT "PK_0402b7fcec5415246656f102f83" PRIMARY KEY ("secretsProviderConnectionId", "projectId");



ALTER TABLE ONLY "public"."installed_packages"
    ADD CONSTRAINT "PK_08cc9197c39b028c1e9beca225940576fd1a5804" PRIMARY KEY ("packageName");



ALTER TABLE ONLY "public"."instance_ai_run_snapshots"
    ADD CONSTRAINT "PK_0a5fc9690a84950ebf1416fb146" PRIMARY KEY ("threadId", "runId");



ALTER TABLE ONLY "public"."instance_ai_messages"
    ADD CONSTRAINT "PK_156c6f287225e9befe0181bb02b" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."execution_metadata"
    ADD CONSTRAINT "PK_17a0b6284f8d626aae88e1c16e4" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."role_mapping_rule_project"
    ADD CONSTRAINT "PK_198c5b5aea509d139274efcaf9a" PRIMARY KEY ("roleMappingRuleId", "projectId");



ALTER TABLE ONLY "public"."project_relation"
    ADD CONSTRAINT "PK_1caaa312a5d7184a003be0f0cb6" PRIMARY KEY ("projectId", "userId");



ALTER TABLE ONLY "public"."chat_hub_sessions"
    ADD CONSTRAINT "PK_1eafef1273c70e4464fec703412" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."instance_ai_iteration_logs"
    ADD CONSTRAINT "PK_21c2b214b44bc6c34a6d3551c90" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."folder_tag"
    ADD CONSTRAINT "PK_27e4e00852f6b06a925a4d83a3e" PRIMARY KEY ("folderId", "tagId");



ALTER TABLE ONLY "public"."instance_ai_threads"
    ADD CONSTRAINT "PK_35575100e45cdedeb89ae0643e9" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "PK_35c9b140caaf6da09cfabb0d675" PRIMARY KEY ("slug");



ALTER TABLE ONLY "public"."secrets_provider_connection"
    ADD CONSTRAINT "PK_4350ae85e76f9ba7df1370acb5d" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."instance_ai_resources"
    ADD CONSTRAINT "PK_45b5b0b6f715dae4292b86603d8" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."project"
    ADD CONSTRAINT "PK_4d68b1358bb5b766d3e78f32f57" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."dynamic_credential_entry"
    ADD CONSTRAINT "PK_5135ffcabecad4727ff6b9b803d" PRIMARY KEY ("credential_id", "subject_id", "resolver_id");



ALTER TABLE ONLY "public"."workflow_dependency"
    ADD CONSTRAINT "PK_52325e34cd7a2f0f67b0f3cad65" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."invalid_auth_token"
    ADD CONSTRAINT "PK_5779069b7235b256d91f7af1a15" PRIMARY KEY ("token");



ALTER TABLE ONLY "public"."shared_workflow"
    ADD CONSTRAINT "PK_5ba87620386b847201c9531c58f" PRIMARY KEY ("workflowId", "projectId");



ALTER TABLE ONLY "public"."workflow_published_version"
    ADD CONSTRAINT "PK_5c76fb7ee939fe2530374d3f75a" PRIMARY KEY ("workflowId");



ALTER TABLE ONLY "public"."folder"
    ADD CONSTRAINT "PK_6278a41a706740c94c02e288df8" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."data_table_column"
    ADD CONSTRAINT "PK_673cb121ee4a8a5e27850c72c51" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chat_hub_tools"
    ADD CONSTRAINT "PK_696d26426c704fba79b2c195ef5" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."annotation_tag_entity"
    ADD CONSTRAINT "PK_69dfa041592c30bbc0d4b84aa00" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user_favorites"
    ADD CONSTRAINT "PK_6c472a19a7423cfbbf6b7c75939" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."instance_ai_observational_memory"
    ADD CONSTRAINT "PK_7192dd00cddba039bf1d3e6a098" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."oauth_refresh_tokens"
    ADD CONSTRAINT "PK_74abaed0b30711b6532598b0392" PRIMARY KEY ("token");



ALTER TABLE ONLY "public"."dynamic_credential_user_entry"
    ADD CONSTRAINT "PK_74f548e633abc66dc27c8f0ca77" PRIMARY KEY ("credentialId", "userId", "resolverId");



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "PK_7704a5add6baed43eef835f0bfb" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."execution_annotations"
    ADD CONSTRAINT "PK_7afcf93ffa20c4252869a7c6a23" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."credential_dependency"
    ADD CONSTRAINT "PK_80212729ed0ffa0709417ab28f4" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."ai_builder_temporary_workflow"
    ADD CONSTRAINT "PK_85a87a1ba0f61999fe11dc56325" PRIMARY KEY ("workflowId");



ALTER TABLE ONLY "public"."oauth_user_consents"
    ADD CONSTRAINT "PK_85b9ada746802c8993103470f05" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."instance_version_history"
    ADD CONSTRAINT "PK_874f58cb616935bf49d9dbd67e9" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chat_hub_session_tools"
    ADD CONSTRAINT "PK_87aea76ff4c274c4a5ac838ebe3" PRIMARY KEY ("sessionId", "toolId");



ALTER TABLE ONLY "public"."migrations"
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."installed_nodes"
    ADD CONSTRAINT "PK_8ebd28194e4f792f96b5933423fc439df97d9689" PRIMARY KEY ("name");



ALTER TABLE ONLY "public"."shared_credentials"
    ADD CONSTRAINT "PK_8ef3a59796a228913f251779cff" PRIMARY KEY ("credentialsId", "projectId");



ALTER TABLE ONLY "public"."test_case_execution"
    ADD CONSTRAINT "PK_90c121f77a78a6580e94b794bce" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."instance_ai_workflow_snapshots"
    ADD CONSTRAINT "PK_93f2696eb321dfe1d7defe7073f" PRIMARY KEY ("runId", "workflowName");



ALTER TABLE ONLY "public"."deployment_key"
    ADD CONSTRAINT "PK_94bb7aeb5def5a0284a5fe9f9a0" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user_api_keys"
    ADD CONSTRAINT "PK_978fa5caa3468f463dac9d92e69" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."execution_annotation_tags"
    ADD CONSTRAINT "PK_979ec03d31294cca484be65d11f" PRIMARY KEY ("annotationId", "tagId");



ALTER TABLE ONLY "public"."trusted_key_source"
    ADD CONSTRAINT "PK_99e8908ce2c2cdccce487db7fc6" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."webhook_entity"
    ADD CONSTRAINT "PK_b21ace2e13596ccd87dc9bf4ea6" PRIMARY KEY ("webhookPath", "method");



ALTER TABLE ONLY "public"."insights_by_period"
    ADD CONSTRAINT "PK_b606942249b90cc39b0265f0575" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workflow_history"
    ADD CONSTRAINT "PK_b6572dd6173e4cd06fe79937b58" PRIMARY KEY ("versionId");



ALTER TABLE ONLY "public"."dynamic_credential_resolver"
    ADD CONSTRAINT "PK_b76cfb088dcdaf5275e9980bb64" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."scope"
    ADD CONSTRAINT "PK_bfc45df0481abd7f355d6187da1" PRIMARY KEY ("slug");



ALTER TABLE ONLY "public"."oauth_clients"
    ADD CONSTRAINT "PK_c4759172d3431bae6f04e678e0d" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workflow_publish_history"
    ADD CONSTRAINT "PK_c788f7caf88e91e365c97d6d04a" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."processed_data"
    ADD CONSTRAINT "PK_ca04b9d8dc72de268fe07a65773" PRIMARY KEY ("workflowId", "context");



ALTER TABLE ONLY "public"."chat_hub_agent_tools"
    ADD CONSTRAINT "PK_cc8806fdea48297a7d497035d72" PRIMARY KEY ("agentId", "toolId");



ALTER TABLE ONLY "public"."role_mapping_rule"
    ADD CONSTRAINT "PK_d772c8ec1a89b52d31c882bc560" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."token_exchange_jti"
    ADD CONSTRAINT "PK_d8e8a6f737d530fdd2dd716e89c" PRIMARY KEY ("jti");



ALTER TABLE ONLY "public"."settings"
    ADD CONSTRAINT "PK_dc0fe14e6d9943f268e7b119f69ab8bd" PRIMARY KEY ("key");



ALTER TABLE ONLY "public"."trusted_key"
    ADD CONSTRAINT "PK_dc7d93798f3dbb6959f974c97e1" PRIMARY KEY ("sourceId", "kid");



ALTER TABLE ONLY "public"."oauth_access_tokens"
    ADD CONSTRAINT "PK_dcd71f96a5d5f4bf79e67d322bf" PRIMARY KEY ("token");



ALTER TABLE ONLY "public"."data_table"
    ADD CONSTRAINT "PK_e226d0001b9e6097cbfe70617cb" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workflow_builder_session"
    ADD CONSTRAINT "PK_e69ef0d385986e273423b0e8695" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "PK_ea8f538c94b6e352418254ed6474a81f" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."insights_raw"
    ADD CONSTRAINT "PK_ec15125755151e3a7e00e00014f" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chat_hub_agents"
    ADD CONSTRAINT "PK_f39a3b36bbdf0e2979ddb21cf78" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."insights_metadata"
    ADD CONSTRAINT "PK_f448a94c35218b6208ce20cf5a1" PRIMARY KEY ("metaId");



ALTER TABLE ONLY "public"."oauth_authorization_codes"
    ADD CONSTRAINT "PK_fb91ab932cfbd694061501cc20f" PRIMARY KEY ("code");



ALTER TABLE ONLY "public"."binary_data"
    ADD CONSTRAINT "PK_fc3691585b39408bb0551122af6" PRIMARY KEY ("fileId");



ALTER TABLE ONLY "public"."role_scope"
    ADD CONSTRAINT "PK_role_scope" PRIMARY KEY ("roleSlug", "scopeSlug");



ALTER TABLE ONLY "public"."oauth_user_consents"
    ADD CONSTRAINT "UQ_083721d99ce8db4033e2958ebb4" UNIQUE ("userId", "clientId");



ALTER TABLE ONLY "public"."data_table_column"
    ADD CONSTRAINT "UQ_8082ec4890f892f0bc77473a123" UNIQUE ("dataTableId", "name");



ALTER TABLE ONLY "public"."data_table"
    ADD CONSTRAINT "UQ_b23096ef747281ac944d28e8b0d" UNIQUE ("projectId", "name");



ALTER TABLE ONLY "public"."role_mapping_rule"
    ADD CONSTRAINT "UQ_b33ac896ad3099fc8de36fdc1c4" UNIQUE ("type", "order");



ALTER TABLE ONLY "public"."user_favorites"
    ADD CONSTRAINT "UQ_cf6ae658ead9ffc124723413c65" UNIQUE ("userId", "resourceId", "resourceType");



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e2" UNIQUE ("email");



ALTER TABLE ONLY "public"."workflow_builder_session"
    ADD CONSTRAINT "UQ_ec2aa73632932d485a1d5192ce1" UNIQUE ("workflowId", "userId");



ALTER TABLE ONLY "public"."auth_identity"
    ADD CONSTRAINT "auth_identity_pkey" PRIMARY KEY ("providerId", "providerType");



ALTER TABLE ONLY "public"."auth_provider_sync_history"
    ADD CONSTRAINT "auth_provider_sync_history_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."credentials_entity"
    ADD CONSTRAINT "credentials_entity_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."event_destinations"
    ADD CONSTRAINT "event_destinations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."execution_data"
    ADD CONSTRAINT "execution_data_pkey" PRIMARY KEY ("executionId");



ALTER TABLE ONLY "public"."execution_entity"
    ADD CONSTRAINT "pk_e3e63bbf986767844bbe1166d4e" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workflows_tags"
    ADD CONSTRAINT "pk_workflows_tags" PRIMARY KEY ("workflowId", "tagId");



ALTER TABLE ONLY "public"."tag_entity"
    ADD CONSTRAINT "tag_entity_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."variables"
    ADD CONSTRAINT "variables_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workflow_entity"
    ADD CONSTRAINT "workflow_entity_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workflow_statistics"
    ADD CONSTRAINT "workflow_statistics_pkey" PRIMARY KEY ("id");



CREATE INDEX "IDX_02751202c9a2ad75f2d8e14f5e" ON "public"."instance_ai_iteration_logs" USING "btree" ("threadId", "taskKey", "createdAt");



CREATE INDEX "IDX_070b5de842ece9ccdda0d9738b" ON "public"."workflow_publish_history" USING "btree" ("workflowId", "versionId");



CREATE UNIQUE INDEX "IDX_14f68deffaf858465715995508" ON "public"."folder" USING "btree" ("projectId", "id");



CREATE INDEX "IDX_1d11050a381548c42c32cc25c4" ON "public"."user_favorites" USING "btree" ("resourceType", "resourceId");



CREATE UNIQUE INDEX "IDX_1d8ab99d5861c9388d2dc1cf73" ON "public"."insights_metadata" USING "btree" ("workflowId");



CREATE INDEX "IDX_1dd5c393ad0517be3c31a7af83" ON "public"."user_favorites" USING "btree" ("userId");



CREATE INDEX "IDX_1e31657f5fe46816c34be7c1b4" ON "public"."workflow_history" USING "btree" ("workflowId");



CREATE INDEX "IDX_1eeb64cb9d66a927988de759e6" ON "public"."instance_ai_messages" USING "btree" ("threadId");



CREATE UNIQUE INDEX "IDX_1ef35bac35d20bdae979d917a3" ON "public"."user_api_keys" USING "btree" ("apiKey");



CREATE INDEX "IDX_35a78869286c65d9330d02b88f" ON "public"."role_mapping_rule_project" USING "btree" ("projectId");



CREATE INDEX "IDX_39b07732e819fb561d74c38763" ON "public"."ai_builder_temporary_workflow" USING "btree" ("threadId");



CREATE UNIQUE INDEX "IDX_4c72ebdb265d1775bf61147af0" ON "public"."chat_hub_tools" USING "btree" ("ownerId", "name");



CREATE INDEX "IDX_56900edc3cfd16612e2ef2c6a8" ON "public"."binary_data" USING "btree" ("sourceType", "sourceId");



CREATE INDEX "IDX_5ec8e8c8d3539f3696cf73b43b" ON "public"."credential_dependency" USING "btree" ("credentialId");



CREATE INDEX "IDX_5f0643f6717905a05164090dde" ON "public"."project_relation" USING "btree" ("userId");



CREATE UNIQUE INDEX "IDX_60b6a84299eeb3f671dfec7693" ON "public"."insights_by_period" USING "btree" ("periodStart", "type", "periodUnit", "metaId");



CREATE INDEX "IDX_61448d56d61802b5dfde5cdb00" ON "public"."project_relation" USING "btree" ("projectId");



CREATE INDEX "IDX_62476b94b56d9dc7ed9ed75d3d" ON "public"."dynamic_credential_entry" USING "btree" ("subject_id");



CREATE UNIQUE INDEX "IDX_63d7bbae72c767cf162d459fcc" ON "public"."user_api_keys" USING "btree" ("userId", "label");



CREATE INDEX "IDX_6edec973a6450990977bb854c3" ON "public"."dynamic_credential_user_entry" USING "btree" ("resolverId");



CREATE INDEX "IDX_76e212c6867fbaa06bf0decd6f" ON "public"."instance_ai_messages" USING "btree" ("resourceId");



CREATE INDEX "IDX_8e4b4774db42f1e6dda3452b2a" ON "public"."test_case_execution" USING "btree" ("testRunId");



CREATE INDEX "IDX_91ee85fa9619dd6776725e117b" ON "public"."credential_dependency" USING "btree" ("dependencyType", "dependencyId");



CREATE INDEX "IDX_92f13cb6bc694227e069447f7b" ON "public"."instance_ai_observational_memory" USING "btree" ("lookupKey");



CREATE UNIQUE INDEX "IDX_97f863fa83c4786f1956508496" ON "public"."execution_annotations" USING "btree" ("executionId");



CREATE INDEX "IDX_9c9ee9df586e60bb723234e499" ON "public"."dynamic_credential_resolver" USING "btree" ("type");



CREATE UNIQUE INDEX "IDX_UniqueRoleDisplayName" ON "public"."role" USING "btree" ("displayName");



CREATE INDEX "IDX_a3697779b366e131b2bbdae297" ON "public"."execution_annotation_tags" USING "btree" ("tagId");



CREATE INDEX "IDX_a36dc616fabc3f736bb82410a2" ON "public"."dynamic_credential_user_entry" USING "btree" ("userId");



CREATE INDEX "IDX_a371ee6b8e0ebb5635f8baa46d" ON "public"."instance_ai_workflow_snapshots" USING "btree" ("workflowName", "status");



CREATE INDEX "IDX_a4ff2d9b9628ea988fa9e7d0bf" ON "public"."workflow_dependency" USING "btree" ("workflowId");



CREATE UNIQUE INDEX "IDX_a680ac96aae02dc887bbaac512" ON "public"."instance_ai_observational_memory" USING "btree" ("scope", "threadId", "resourceId");



CREATE UNIQUE INDEX "IDX_ae51b54c4bb430cf92f48b623f" ON "public"."annotation_tag_entity" USING "btree" ("name");



CREATE INDEX "IDX_bb66e404c35996b0d694617750" ON "public"."role_mapping_rule" USING "btree" ("role");



CREATE INDEX "IDX_c1519757391996eb06064f0e7c" ON "public"."execution_annotation_tags" USING "btree" ("annotationId");



CREATE UNIQUE INDEX "IDX_cec8eea3bf49551482ccb4933e" ON "public"."execution_metadata" USING "btree" ("executionId", "key");



CREATE INDEX "IDX_chat_hub_messages_sessionId" ON "public"."chat_hub_messages" USING "btree" ("sessionId");



CREATE INDEX "IDX_chat_hub_sessions_owner_lastmsg_id" ON "public"."chat_hub_sessions" USING "btree" ("ownerId", "lastMessageAt" DESC, "id");



CREATE UNIQUE INDEX "IDX_credential_dependency_credentialId_dependencyType_dependenc" ON "public"."credential_dependency" USING "btree" ("credentialId", "dependencyType", "dependencyId");



CREATE INDEX "IDX_d3a2bc880e7a8626802e5474ad" ON "public"."instance_ai_run_snapshots" USING "btree" ("threadId", "createdAt");



CREATE INDEX "IDX_d61a12235d268a49af6a3c09c1" ON "public"."dynamic_credential_entry" USING "btree" ("resolver_id");



CREATE INDEX "IDX_d6870d3b6e4c185d33926f423c" ON "public"."test_run" USING "btree" ("workflowId");



CREATE INDEX "IDX_d926c16c2ad9728cb9a81790c0" ON "public"."instance_ai_run_snapshots" USING "btree" ("threadId", "messageGroupId");



CREATE UNIQUE INDEX "IDX_deployment_key_data_encryption_active" ON "public"."deployment_key" USING "btree" ("type") WHERE ((("status")::"text" = 'active'::"text") AND (("type")::"text" = 'data_encryption'::"text"));



CREATE UNIQUE INDEX "IDX_deployment_key_instance_id_active" ON "public"."deployment_key" USING "btree" ("type") WHERE ((("status")::"text" = 'active'::"text") AND (("type")::"text" = 'instance.id'::"text"));



CREATE UNIQUE INDEX "IDX_deployment_key_signing_binary_data_active" ON "public"."deployment_key" USING "btree" ("type") WHERE ((("status")::"text" = 'active'::"text") AND (("type")::"text" = 'signing.binary_data'::"text"));



CREATE UNIQUE INDEX "IDX_deployment_key_signing_hmac_active" ON "public"."deployment_key" USING "btree" ("type") WHERE ((("status")::"text" = 'active'::"text") AND (("type")::"text" = 'signing.hmac'::"text"));



CREATE UNIQUE INDEX "IDX_deployment_key_signing_jwt_active" ON "public"."deployment_key" USING "btree" ("type") WHERE ((("status")::"text" = 'active'::"text") AND (("type")::"text" = 'signing.jwt'::"text"));



CREATE INDEX "IDX_e48a201071ab85d9d09119d640" ON "public"."workflow_dependency" USING "btree" ("dependencyKey");



CREATE INDEX "IDX_e7fe1cfda990c14a445937d0b9" ON "public"."workflow_dependency" USING "btree" ("dependencyType");



CREATE INDEX "IDX_execution_entity_deletedAt" ON "public"."execution_entity" USING "btree" ("deletedAt");



CREATE INDEX "IDX_f36dea4d38fe92e0e8f44d5a56" ON "public"."instance_ai_threads" USING "btree" ("resourceId");



CREATE INDEX "IDX_role_scope_scopeSlug" ON "public"."role_scope" USING "btree" ("scopeSlug");



CREATE UNIQUE INDEX "IDX_secrets_provider_connection_providerKey" ON "public"."secrets_provider_connection" USING "btree" ("providerKey");



CREATE INDEX "IDX_workflow_dependency_publishedVersionId" ON "public"."workflow_dependency" USING "btree" ("publishedVersionId");



CREATE INDEX "IDX_workflow_entity_name" ON "public"."workflow_entity" USING "btree" ("name");



CREATE UNIQUE INDEX "IDX_workflow_statistics_workflow_name" ON "public"."workflow_statistics" USING "btree" ("workflowId", "name");



CREATE INDEX "idx_07fde106c0b471d8cc80a64fc8" ON "public"."credentials_entity" USING "btree" ("type");



CREATE INDEX "idx_16f4436789e804e3e1c9eeb240" ON "public"."webhook_entity" USING "btree" ("webhookId", "method", "pathLength");



CREATE UNIQUE INDEX "idx_812eb05f7451ca757fb98444ce" ON "public"."tag_entity" USING "btree" ("name");



CREATE INDEX "idx_execution_entity_stopped_at_status_deleted_at" ON "public"."execution_entity" USING "btree" ("stoppedAt", "status", "deletedAt") WHERE (("stoppedAt" IS NOT NULL) AND ("deletedAt" IS NULL));



CREATE INDEX "idx_execution_entity_wait_till_status_deleted_at" ON "public"."execution_entity" USING "btree" ("waitTill", "status", "deletedAt") WHERE (("waitTill" IS NOT NULL) AND ("deletedAt" IS NULL));



CREATE INDEX "idx_execution_entity_workflow_id_started_at" ON "public"."execution_entity" USING "btree" ("workflowId", "startedAt") WHERE (("startedAt" IS NOT NULL) AND ("deletedAt" IS NULL));



CREATE INDEX "idx_workflows_tags_workflow_id" ON "public"."workflows_tags" USING "btree" ("workflowId");



CREATE UNIQUE INDEX "pk_credentials_entity_id" ON "public"."credentials_entity" USING "btree" ("id");



CREATE UNIQUE INDEX "pk_tag_entity_id" ON "public"."tag_entity" USING "btree" ("id");



CREATE UNIQUE INDEX "pk_workflow_entity_id" ON "public"."workflow_entity" USING "btree" ("id");



CREATE INDEX "project_relation_role_idx" ON "public"."project_relation" USING "btree" ("role");



CREATE INDEX "project_relation_role_project_idx" ON "public"."project_relation" USING "btree" ("projectId", "role");



CREATE INDEX "user_role_idx" ON "public"."user" USING "btree" ("roleSlug");



CREATE UNIQUE INDEX "variables_global_key_unique" ON "public"."variables" USING "btree" ("key") WHERE ("projectId" IS NULL);



CREATE UNIQUE INDEX "variables_project_key_unique" ON "public"."variables" USING "btree" ("projectId", "key") WHERE ("projectId" IS NOT NULL);



CREATE OR REPLACE TRIGGER "workflow_version_increment" BEFORE UPDATE ON "public"."workflow_entity" FOR EACH ROW EXECUTE FUNCTION "public"."increment_workflow_version"();



ALTER TABLE ONLY "public"."workflow_builder_session"
    ADD CONSTRAINT "FK_00290cdeee4d4d7db84709be936" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."processed_data"
    ADD CONSTRAINT "FK_06a69a7032c97a763c2c7599464" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_entity"
    ADD CONSTRAINT "FK_08d6c67b7f722b0039d9d5ed620" FOREIGN KEY ("activeVersionId") REFERENCES "public"."workflow_history"("versionId") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."project_secrets_provider_access"
    ADD CONSTRAINT "FK_18e5c27d2524b1638b292904e48" FOREIGN KEY ("secretsProviderConnectionId") REFERENCES "public"."secrets_provider_connection"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."insights_metadata"
    ADD CONSTRAINT "FK_1d8ab99d5861c9388d2dc1cf733" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."user_favorites"
    ADD CONSTRAINT "FK_1dd5c393ad0517be3c31a7af836" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_history"
    ADD CONSTRAINT "FK_1e31657f5fe46816c34be7c1b4b" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."instance_ai_messages"
    ADD CONSTRAINT "FK_1eeb64cb9d66a927988de759e6e" FOREIGN KEY ("threadId") REFERENCES "public"."instance_ai_threads"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_1f4998c8a7dec9e00a9ab15550e" FOREIGN KEY ("revisionOfMessageId") REFERENCES "public"."chat_hub_messages"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_user_consents"
    ADD CONSTRAINT "FK_21e6c3c2d78a097478fae6aaefa" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."insights_metadata"
    ADD CONSTRAINT "FK_2375a1eda085adb16b24615b69c" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_25c9736e7f769f3a005eef4b372" FOREIGN KEY ("retryOfMessageId") REFERENCES "public"."chat_hub_messages"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_agent_tools"
    ADD CONSTRAINT "FK_2b53d796b3dbae91b1a9553c048" FOREIGN KEY ("agentId") REFERENCES "public"."chat_hub_agents"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."instance_ai_run_snapshots"
    ADD CONSTRAINT "FK_2f63fa21d09d7918f347ddbdf70" FOREIGN KEY ("threadId") REFERENCES "public"."instance_ai_threads"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."execution_metadata"
    ADD CONSTRAINT "FK_31d0b4c93fb85ced26f6005cda3" FOREIGN KEY ("executionId") REFERENCES "public"."execution_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."instance_ai_observational_memory"
    ADD CONSTRAINT "FK_34018c303885cd37093458e6409" FOREIGN KEY ("threadId") REFERENCES "public"."instance_ai_threads"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."role_mapping_rule_project"
    ADD CONSTRAINT "FK_35a78869286c65d9330d02b88f5" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ai_builder_temporary_workflow"
    ADD CONSTRAINT "FK_39b07732e819fb561d74c38763f" FOREIGN KEY ("threadId") REFERENCES "public"."instance_ai_threads"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shared_credentials"
    ADD CONSTRAINT "FK_416f66fc846c7c442970c094ccf" FOREIGN KEY ("credentialsId") REFERENCES "public"."credentials_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."variables"
    ADD CONSTRAINT "FK_42f6c766f9f9d2edcc15bdd6e9b" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_agent_tools"
    ADD CONSTRAINT "FK_43e70f04c53344f82483d0570f6" FOREIGN KEY ("toolId") REFERENCES "public"."chat_hub_tools"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_agents"
    ADD CONSTRAINT "FK_441ba2caba11e077ce3fbfa2cd8" FOREIGN KEY ("ownerId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_published_version"
    ADD CONSTRAINT "FK_5c76fb7ee939fe2530374d3f75a" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."credential_dependency"
    ADD CONSTRAINT "FK_5ec8e8c8d3539f3696cf73b43bf" FOREIGN KEY ("credentialId") REFERENCES "public"."credentials_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."project_relation"
    ADD CONSTRAINT "FK_5f0643f6717905a05164090dde7" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."project_relation"
    ADD CONSTRAINT "FK_61448d56d61802b5dfde5cdb002" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."insights_by_period"
    ADD CONSTRAINT "FK_6414cfed98daabbfdd61a1cfbc0" FOREIGN KEY ("metaId") REFERENCES "public"."insights_metadata"("metaId") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_authorization_codes"
    ADD CONSTRAINT "FK_64d965bd072ea24fb6da55468cd" FOREIGN KEY ("clientId") REFERENCES "public"."oauth_clients"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_session_tools"
    ADD CONSTRAINT "FK_6596a328affd8d4967ffb303eee" FOREIGN KEY ("toolId") REFERENCES "public"."chat_hub_tools"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_6afb260449dd7a9b85355d4e0c9" FOREIGN KEY ("executionId") REFERENCES "public"."execution_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."insights_raw"
    ADD CONSTRAINT "FK_6e2e33741adef2a7c5d66befa4e" FOREIGN KEY ("metaId") REFERENCES "public"."insights_metadata"("metaId") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_publish_history"
    ADD CONSTRAINT "FK_6eab5bd9eedabe9c54bd879fc40" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."dynamic_credential_user_entry"
    ADD CONSTRAINT "FK_6edec973a6450990977bb854c38" FOREIGN KEY ("resolverId") REFERENCES "public"."dynamic_credential_resolver"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_access_tokens"
    ADD CONSTRAINT "FK_7234a36d8e49a1fa85095328845" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."installed_nodes"
    ADD CONSTRAINT "FK_73f857fc5dce682cef8a99c11dbddbc969618951" FOREIGN KEY ("package") REFERENCES "public"."installed_packages"("packageName") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_access_tokens"
    ADD CONSTRAINT "FK_78b26968132b7e5e45b75876481" FOREIGN KEY ("clientId") REFERENCES "public"."oauth_clients"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_builder_session"
    ADD CONSTRAINT "FK_7983c618db48f47bf5a4cc1e1e4" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_sessions"
    ADD CONSTRAINT "FK_7bc13b4c7e6afbfaf9be326c189" FOREIGN KEY ("credentialId") REFERENCES "public"."credentials_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."folder"
    ADD CONSTRAINT "FK_804ea52f6729e3940498bd54d78" FOREIGN KEY ("parentFolderId") REFERENCES "public"."folder"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shared_credentials"
    ADD CONSTRAINT "FK_812c2852270da1247756e77f5a4" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ai_builder_temporary_workflow"
    ADD CONSTRAINT "FK_85a87a1ba0f61999fe11dc56325" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."instance_ai_iteration_logs"
    ADD CONSTRAINT "FK_8bfcc6c51fd3d69b1eae8aebd49" FOREIGN KEY ("threadId") REFERENCES "public"."instance_ai_threads"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."trusted_key"
    ADD CONSTRAINT "FK_8c2938d746943dd8f608d23c891" FOREIGN KEY ("sourceId") REFERENCES "public"."trusted_key_source"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."test_case_execution"
    ADD CONSTRAINT "FK_8e4b4774db42f1e6dda3452b2af" FOREIGN KEY ("testRunId") REFERENCES "public"."test_run"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."data_table_column"
    ADD CONSTRAINT "FK_930b6e8faaf88294cef23484160" FOREIGN KEY ("dataTableId") REFERENCES "public"."data_table"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."dynamic_credential_user_entry"
    ADD CONSTRAINT "FK_945ba70b342a066d1306b12ccd2" FOREIGN KEY ("credentialId") REFERENCES "public"."credentials_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."folder_tag"
    ADD CONSTRAINT "FK_94a60854e06f2897b2e0d39edba" FOREIGN KEY ("folderId") REFERENCES "public"."folder"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."execution_annotations"
    ADD CONSTRAINT "FK_97f863fa83c4786f19565084960" FOREIGN KEY ("executionId") REFERENCES "public"."execution_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_agents"
    ADD CONSTRAINT "FK_9c61ad497dcbae499c96a6a78ba" FOREIGN KEY ("credentialId") REFERENCES "public"."credentials_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."chat_hub_sessions"
    ADD CONSTRAINT "FK_9f9293d9f552496c40e0d1a8f80" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."execution_annotation_tags"
    ADD CONSTRAINT "FK_a3697779b366e131b2bbdae2976" FOREIGN KEY ("tagId") REFERENCES "public"."annotation_tag_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."dynamic_credential_user_entry"
    ADD CONSTRAINT "FK_a36dc616fabc3f736bb82410a22" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shared_workflow"
    ADD CONSTRAINT "FK_a45ea5f27bcfdc21af9b4188560" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_dependency"
    ADD CONSTRAINT "FK_a4ff2d9b9628ea988fa9e7d0bf8" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_user_consents"
    ADD CONSTRAINT "FK_a651acea2f6c97f8c4514935486" FOREIGN KEY ("clientId") REFERENCES "public"."oauth_clients"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_refresh_tokens"
    ADD CONSTRAINT "FK_a699f3ed9fd0c1b19bc2608ac53" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."dynamic_credential_entry"
    ADD CONSTRAINT "FK_a6d1dd080958304a47a02952aab" FOREIGN KEY ("credential_id") REFERENCES "public"."credentials_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."folder"
    ADD CONSTRAINT "FK_a8260b0b36939c6247f385b8221" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oauth_authorization_codes"
    ADD CONSTRAINT "FK_aa8d3560484944c19bdf79ffa16" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_acf8926098f063cdbbad8497fd1" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."oauth_refresh_tokens"
    ADD CONSTRAINT "FK_b388696ce4d8be7ffbe8d3e4b69" FOREIGN KEY ("clientId") REFERENCES "public"."oauth_clients"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_publish_history"
    ADD CONSTRAINT "FK_b4cfbc7556d07f36ca177f5e473" FOREIGN KEY ("versionId") REFERENCES "public"."workflow_history"("versionId") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."chat_hub_tools"
    ADD CONSTRAINT "FK_b8030b47af9213f1fd15450fb7f" FOREIGN KEY ("ownerId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."role_mapping_rule"
    ADD CONSTRAINT "FK_bb66e404c35996b0d6946177501" FOREIGN KEY ("role") REFERENCES "public"."role"("slug") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."project_secrets_provider_access"
    ADD CONSTRAINT "FK_bd264b81209355b543878deedb1" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_publish_history"
    ADD CONSTRAINT "FK_c01316f8c2d7101ec4fa9809267" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."execution_annotation_tags"
    ADD CONSTRAINT "FK_c1519757391996eb06064f0e7c8" FOREIGN KEY ("annotationId") REFERENCES "public"."execution_annotations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."data_table"
    ADD CONSTRAINT "FK_c2a794257dee48af7c9abf681de" FOREIGN KEY ("projectId") REFERENCES "public"."project"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."project_relation"
    ADD CONSTRAINT "FK_c6b99592dc96b0d836d7a21db91" FOREIGN KEY ("role") REFERENCES "public"."role"("slug");



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_chat_hub_messages_agentId" FOREIGN KEY ("agentId") REFERENCES "public"."chat_hub_agents"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."chat_hub_sessions"
    ADD CONSTRAINT "FK_chat_hub_sessions_agentId" FOREIGN KEY ("agentId") REFERENCES "public"."chat_hub_agents"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."dynamic_credential_entry"
    ADD CONSTRAINT "FK_d61a12235d268a49af6a3c09c13" FOREIGN KEY ("resolver_id") REFERENCES "public"."dynamic_credential_resolver"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."test_run"
    ADD CONSTRAINT "FK_d6870d3b6e4c185d33926f423c8" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."shared_workflow"
    ADD CONSTRAINT "FK_daa206a04983d47d0a9c34649ce" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."folder_tag"
    ADD CONSTRAINT "FK_dc88164176283de80af47621746" FOREIGN KEY ("tagId") REFERENCES "public"."tag_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."role_mapping_rule_project"
    ADD CONSTRAINT "FK_dd7ce4dfa09e95b36a626bd9de3" FOREIGN KEY ("roleMappingRuleId") REFERENCES "public"."role_mapping_rule"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_published_version"
    ADD CONSTRAINT "FK_df3428a541b802d6a63ac56e330" FOREIGN KEY ("publishedVersionId") REFERENCES "public"."workflow_history"("versionId") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."user_api_keys"
    ADD CONSTRAINT "FK_e131705cbbc8fb589889b02d457" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_e22538eb50a71a17954cd7e076c" FOREIGN KEY ("sessionId") REFERENCES "public"."chat_hub_sessions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."test_case_execution"
    ADD CONSTRAINT "FK_e48965fac35d0f5b9e7f51d8c44" FOREIGN KEY ("executionId") REFERENCES "public"."execution_entity"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."chat_hub_messages"
    ADD CONSTRAINT "FK_e5d1fa722c5a8d38ac204746662" FOREIGN KEY ("previousMessageId") REFERENCES "public"."chat_hub_messages"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_session_tools"
    ADD CONSTRAINT "FK_e649bf1295f4ed8d4299ed290f9" FOREIGN KEY ("sessionId") REFERENCES "public"."chat_hub_sessions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_hub_sessions"
    ADD CONSTRAINT "FK_e9ecf8ede7d989fcd18790fe36a" FOREIGN KEY ("ownerId") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "FK_eaea92ee7bfb9c1b6cd01505d56" FOREIGN KEY ("roleSlug") REFERENCES "public"."role"("slug");



ALTER TABLE ONLY "public"."role_scope"
    ADD CONSTRAINT "FK_role" FOREIGN KEY ("roleSlug") REFERENCES "public"."role"("slug") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."role_scope"
    ADD CONSTRAINT "FK_scope" FOREIGN KEY ("scopeSlug") REFERENCES "public"."scope"("slug") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."auth_identity"
    ADD CONSTRAINT "auth_identity_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."user"("id");



ALTER TABLE ONLY "public"."credentials_entity"
    ADD CONSTRAINT "credentials_entity_resolverId_foreign" FOREIGN KEY ("resolverId") REFERENCES "public"."dynamic_credential_resolver"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."execution_data"
    ADD CONSTRAINT "execution_data_fk" FOREIGN KEY ("executionId") REFERENCES "public"."execution_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."execution_entity"
    ADD CONSTRAINT "fk_execution_entity_workflow_id" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."webhook_entity"
    ADD CONSTRAINT "fk_webhook_entity_workflow_id" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflow_entity"
    ADD CONSTRAINT "fk_workflow_parent_folder" FOREIGN KEY ("parentFolderId") REFERENCES "public"."folder"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflows_tags"
    ADD CONSTRAINT "fk_workflows_tags_tag_id" FOREIGN KEY ("tagId") REFERENCES "public"."tag_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."workflows_tags"
    ADD CONSTRAINT "fk_workflows_tags_workflow_id" FOREIGN KEY ("workflowId") REFERENCES "public"."workflow_entity"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."project"
    ADD CONSTRAINT "projects_creatorId_foreign" FOREIGN KEY ("creatorId") REFERENCES "public"."user"("id") ON DELETE SET NULL;



ALTER TABLE "public"."ai_builder_temporary_workflow" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."annotation_tag_entity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."auth_identity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."auth_provider_sync_history" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."binary_data" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."chat_hub_agent_tools" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."chat_hub_agents" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."chat_hub_messages" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."chat_hub_session_tools" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."chat_hub_sessions" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."chat_hub_tools" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."credential_dependency" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."credentials_entity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."data_table" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."data_table_column" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."deployment_key" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."dynamic_credential_entry" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."dynamic_credential_resolver" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."dynamic_credential_user_entry" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."event_destinations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."execution_annotation_tags" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."execution_annotations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."execution_data" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."execution_entity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."execution_metadata" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."folder" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."folder_tag" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."insights_by_period" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."insights_metadata" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."insights_raw" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."installed_nodes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."installed_packages" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_iteration_logs" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_messages" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_observational_memory" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_resources" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_run_snapshots" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_threads" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_ai_workflow_snapshots" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instance_version_history" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."invalid_auth_token" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."migrations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."oauth_access_tokens" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."oauth_authorization_codes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."oauth_clients" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."oauth_refresh_tokens" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."oauth_user_consents" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."processed_data" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."project" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."project_relation" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."project_secrets_provider_access" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."role" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."role_mapping_rule" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."role_mapping_rule_project" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."role_scope" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."scope" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."secrets_provider_connection" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."settings" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."shared_credentials" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."shared_workflow" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tag_entity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."test_case_execution" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."test_run" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."token_exchange_jti" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."trusted_key" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."trusted_key_source" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_api_keys" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_favorites" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."variables" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."webhook_entity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_builder_session" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_dependency" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_entity" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_history" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_publish_history" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_published_version" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflow_statistics" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."workflows_tags" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";






















































































































































GRANT ALL ON FUNCTION "public"."increment_workflow_version"() TO "anon";
GRANT ALL ON FUNCTION "public"."increment_workflow_version"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."increment_workflow_version"() TO "service_role";



GRANT ALL ON FUNCTION "public"."rls_auto_enable"() TO "anon";
GRANT ALL ON FUNCTION "public"."rls_auto_enable"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."rls_auto_enable"() TO "service_role";


















GRANT ALL ON TABLE "public"."ai_builder_temporary_workflow" TO "anon";
GRANT ALL ON TABLE "public"."ai_builder_temporary_workflow" TO "authenticated";
GRANT ALL ON TABLE "public"."ai_builder_temporary_workflow" TO "service_role";



GRANT ALL ON TABLE "public"."annotation_tag_entity" TO "anon";
GRANT ALL ON TABLE "public"."annotation_tag_entity" TO "authenticated";
GRANT ALL ON TABLE "public"."annotation_tag_entity" TO "service_role";



GRANT ALL ON TABLE "public"."auth_identity" TO "anon";
GRANT ALL ON TABLE "public"."auth_identity" TO "authenticated";
GRANT ALL ON TABLE "public"."auth_identity" TO "service_role";



GRANT ALL ON TABLE "public"."auth_provider_sync_history" TO "anon";
GRANT ALL ON TABLE "public"."auth_provider_sync_history" TO "authenticated";
GRANT ALL ON TABLE "public"."auth_provider_sync_history" TO "service_role";



GRANT ALL ON SEQUENCE "public"."auth_provider_sync_history_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."auth_provider_sync_history_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."auth_provider_sync_history_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."binary_data" TO "anon";
GRANT ALL ON TABLE "public"."binary_data" TO "authenticated";
GRANT ALL ON TABLE "public"."binary_data" TO "service_role";



GRANT ALL ON TABLE "public"."chat_hub_agent_tools" TO "anon";
GRANT ALL ON TABLE "public"."chat_hub_agent_tools" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_hub_agent_tools" TO "service_role";



GRANT ALL ON TABLE "public"."chat_hub_agents" TO "anon";
GRANT ALL ON TABLE "public"."chat_hub_agents" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_hub_agents" TO "service_role";



GRANT ALL ON TABLE "public"."chat_hub_messages" TO "anon";
GRANT ALL ON TABLE "public"."chat_hub_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_hub_messages" TO "service_role";



GRANT ALL ON TABLE "public"."chat_hub_session_tools" TO "anon";
GRANT ALL ON TABLE "public"."chat_hub_session_tools" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_hub_session_tools" TO "service_role";



GRANT ALL ON TABLE "public"."chat_hub_sessions" TO "anon";
GRANT ALL ON TABLE "public"."chat_hub_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_hub_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."chat_hub_tools" TO "anon";
GRANT ALL ON TABLE "public"."chat_hub_tools" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_hub_tools" TO "service_role";



GRANT ALL ON TABLE "public"."credential_dependency" TO "anon";
GRANT ALL ON TABLE "public"."credential_dependency" TO "authenticated";
GRANT ALL ON TABLE "public"."credential_dependency" TO "service_role";



GRANT ALL ON SEQUENCE "public"."credential_dependency_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."credential_dependency_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."credential_dependency_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."credentials_entity" TO "anon";
GRANT ALL ON TABLE "public"."credentials_entity" TO "authenticated";
GRANT ALL ON TABLE "public"."credentials_entity" TO "service_role";



GRANT ALL ON TABLE "public"."data_table" TO "anon";
GRANT ALL ON TABLE "public"."data_table" TO "authenticated";
GRANT ALL ON TABLE "public"."data_table" TO "service_role";



GRANT ALL ON TABLE "public"."data_table_column" TO "anon";
GRANT ALL ON TABLE "public"."data_table_column" TO "authenticated";
GRANT ALL ON TABLE "public"."data_table_column" TO "service_role";



GRANT ALL ON TABLE "public"."deployment_key" TO "anon";
GRANT ALL ON TABLE "public"."deployment_key" TO "authenticated";
GRANT ALL ON TABLE "public"."deployment_key" TO "service_role";



GRANT ALL ON TABLE "public"."dynamic_credential_entry" TO "anon";
GRANT ALL ON TABLE "public"."dynamic_credential_entry" TO "authenticated";
GRANT ALL ON TABLE "public"."dynamic_credential_entry" TO "service_role";



GRANT ALL ON TABLE "public"."dynamic_credential_resolver" TO "anon";
GRANT ALL ON TABLE "public"."dynamic_credential_resolver" TO "authenticated";
GRANT ALL ON TABLE "public"."dynamic_credential_resolver" TO "service_role";



GRANT ALL ON TABLE "public"."dynamic_credential_user_entry" TO "anon";
GRANT ALL ON TABLE "public"."dynamic_credential_user_entry" TO "authenticated";
GRANT ALL ON TABLE "public"."dynamic_credential_user_entry" TO "service_role";



GRANT ALL ON TABLE "public"."event_destinations" TO "anon";
GRANT ALL ON TABLE "public"."event_destinations" TO "authenticated";
GRANT ALL ON TABLE "public"."event_destinations" TO "service_role";



GRANT ALL ON TABLE "public"."execution_annotation_tags" TO "anon";
GRANT ALL ON TABLE "public"."execution_annotation_tags" TO "authenticated";
GRANT ALL ON TABLE "public"."execution_annotation_tags" TO "service_role";



GRANT ALL ON TABLE "public"."execution_annotations" TO "anon";
GRANT ALL ON TABLE "public"."execution_annotations" TO "authenticated";
GRANT ALL ON TABLE "public"."execution_annotations" TO "service_role";



GRANT ALL ON SEQUENCE "public"."execution_annotations_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."execution_annotations_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."execution_annotations_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."execution_data" TO "anon";
GRANT ALL ON TABLE "public"."execution_data" TO "authenticated";
GRANT ALL ON TABLE "public"."execution_data" TO "service_role";



GRANT ALL ON TABLE "public"."execution_entity" TO "anon";
GRANT ALL ON TABLE "public"."execution_entity" TO "authenticated";
GRANT ALL ON TABLE "public"."execution_entity" TO "service_role";



GRANT ALL ON SEQUENCE "public"."execution_entity_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."execution_entity_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."execution_entity_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."execution_metadata" TO "anon";
GRANT ALL ON TABLE "public"."execution_metadata" TO "authenticated";
GRANT ALL ON TABLE "public"."execution_metadata" TO "service_role";



GRANT ALL ON SEQUENCE "public"."execution_metadata_temp_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."execution_metadata_temp_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."execution_metadata_temp_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."folder" TO "anon";
GRANT ALL ON TABLE "public"."folder" TO "authenticated";
GRANT ALL ON TABLE "public"."folder" TO "service_role";



GRANT ALL ON TABLE "public"."folder_tag" TO "anon";
GRANT ALL ON TABLE "public"."folder_tag" TO "authenticated";
GRANT ALL ON TABLE "public"."folder_tag" TO "service_role";



GRANT ALL ON TABLE "public"."insights_by_period" TO "anon";
GRANT ALL ON TABLE "public"."insights_by_period" TO "authenticated";
GRANT ALL ON TABLE "public"."insights_by_period" TO "service_role";



GRANT ALL ON SEQUENCE "public"."insights_by_period_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."insights_by_period_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."insights_by_period_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."insights_metadata" TO "anon";
GRANT ALL ON TABLE "public"."insights_metadata" TO "authenticated";
GRANT ALL ON TABLE "public"."insights_metadata" TO "service_role";



GRANT ALL ON SEQUENCE "public"."insights_metadata_metaId_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."insights_metadata_metaId_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."insights_metadata_metaId_seq" TO "service_role";



GRANT ALL ON TABLE "public"."insights_raw" TO "anon";
GRANT ALL ON TABLE "public"."insights_raw" TO "authenticated";
GRANT ALL ON TABLE "public"."insights_raw" TO "service_role";



GRANT ALL ON SEQUENCE "public"."insights_raw_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."insights_raw_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."insights_raw_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."installed_nodes" TO "anon";
GRANT ALL ON TABLE "public"."installed_nodes" TO "authenticated";
GRANT ALL ON TABLE "public"."installed_nodes" TO "service_role";



GRANT ALL ON TABLE "public"."installed_packages" TO "anon";
GRANT ALL ON TABLE "public"."installed_packages" TO "authenticated";
GRANT ALL ON TABLE "public"."installed_packages" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_iteration_logs" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_iteration_logs" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_iteration_logs" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_messages" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_messages" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_observational_memory" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_observational_memory" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_observational_memory" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_resources" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_resources" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_resources" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_run_snapshots" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_run_snapshots" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_run_snapshots" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_threads" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_threads" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_threads" TO "service_role";



GRANT ALL ON TABLE "public"."instance_ai_workflow_snapshots" TO "anon";
GRANT ALL ON TABLE "public"."instance_ai_workflow_snapshots" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_ai_workflow_snapshots" TO "service_role";



GRANT ALL ON TABLE "public"."instance_version_history" TO "anon";
GRANT ALL ON TABLE "public"."instance_version_history" TO "authenticated";
GRANT ALL ON TABLE "public"."instance_version_history" TO "service_role";



GRANT ALL ON SEQUENCE "public"."instance_version_history_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."instance_version_history_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."instance_version_history_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."invalid_auth_token" TO "anon";
GRANT ALL ON TABLE "public"."invalid_auth_token" TO "authenticated";
GRANT ALL ON TABLE "public"."invalid_auth_token" TO "service_role";



GRANT ALL ON TABLE "public"."migrations" TO "anon";
GRANT ALL ON TABLE "public"."migrations" TO "authenticated";
GRANT ALL ON TABLE "public"."migrations" TO "service_role";



GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."oauth_access_tokens" TO "anon";
GRANT ALL ON TABLE "public"."oauth_access_tokens" TO "authenticated";
GRANT ALL ON TABLE "public"."oauth_access_tokens" TO "service_role";



GRANT ALL ON TABLE "public"."oauth_authorization_codes" TO "anon";
GRANT ALL ON TABLE "public"."oauth_authorization_codes" TO "authenticated";
GRANT ALL ON TABLE "public"."oauth_authorization_codes" TO "service_role";



GRANT ALL ON TABLE "public"."oauth_clients" TO "anon";
GRANT ALL ON TABLE "public"."oauth_clients" TO "authenticated";
GRANT ALL ON TABLE "public"."oauth_clients" TO "service_role";



GRANT ALL ON TABLE "public"."oauth_refresh_tokens" TO "anon";
GRANT ALL ON TABLE "public"."oauth_refresh_tokens" TO "authenticated";
GRANT ALL ON TABLE "public"."oauth_refresh_tokens" TO "service_role";



GRANT ALL ON TABLE "public"."oauth_user_consents" TO "anon";
GRANT ALL ON TABLE "public"."oauth_user_consents" TO "authenticated";
GRANT ALL ON TABLE "public"."oauth_user_consents" TO "service_role";



GRANT ALL ON SEQUENCE "public"."oauth_user_consents_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."oauth_user_consents_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."oauth_user_consents_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."processed_data" TO "anon";
GRANT ALL ON TABLE "public"."processed_data" TO "authenticated";
GRANT ALL ON TABLE "public"."processed_data" TO "service_role";



GRANT ALL ON TABLE "public"."project" TO "anon";
GRANT ALL ON TABLE "public"."project" TO "authenticated";
GRANT ALL ON TABLE "public"."project" TO "service_role";



GRANT ALL ON TABLE "public"."project_relation" TO "anon";
GRANT ALL ON TABLE "public"."project_relation" TO "authenticated";
GRANT ALL ON TABLE "public"."project_relation" TO "service_role";



GRANT ALL ON TABLE "public"."project_secrets_provider_access" TO "anon";
GRANT ALL ON TABLE "public"."project_secrets_provider_access" TO "authenticated";
GRANT ALL ON TABLE "public"."project_secrets_provider_access" TO "service_role";



GRANT ALL ON TABLE "public"."role" TO "anon";
GRANT ALL ON TABLE "public"."role" TO "authenticated";
GRANT ALL ON TABLE "public"."role" TO "service_role";



GRANT ALL ON TABLE "public"."role_mapping_rule" TO "anon";
GRANT ALL ON TABLE "public"."role_mapping_rule" TO "authenticated";
GRANT ALL ON TABLE "public"."role_mapping_rule" TO "service_role";



GRANT ALL ON TABLE "public"."role_mapping_rule_project" TO "anon";
GRANT ALL ON TABLE "public"."role_mapping_rule_project" TO "authenticated";
GRANT ALL ON TABLE "public"."role_mapping_rule_project" TO "service_role";



GRANT ALL ON TABLE "public"."role_scope" TO "anon";
GRANT ALL ON TABLE "public"."role_scope" TO "authenticated";
GRANT ALL ON TABLE "public"."role_scope" TO "service_role";



GRANT ALL ON TABLE "public"."scope" TO "anon";
GRANT ALL ON TABLE "public"."scope" TO "authenticated";
GRANT ALL ON TABLE "public"."scope" TO "service_role";



GRANT ALL ON TABLE "public"."secrets_provider_connection" TO "anon";
GRANT ALL ON TABLE "public"."secrets_provider_connection" TO "authenticated";
GRANT ALL ON TABLE "public"."secrets_provider_connection" TO "service_role";



GRANT ALL ON SEQUENCE "public"."secrets_provider_connection_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."secrets_provider_connection_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."secrets_provider_connection_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."settings" TO "anon";
GRANT ALL ON TABLE "public"."settings" TO "authenticated";
GRANT ALL ON TABLE "public"."settings" TO "service_role";



GRANT ALL ON TABLE "public"."shared_credentials" TO "anon";
GRANT ALL ON TABLE "public"."shared_credentials" TO "authenticated";
GRANT ALL ON TABLE "public"."shared_credentials" TO "service_role";



GRANT ALL ON TABLE "public"."shared_workflow" TO "anon";
GRANT ALL ON TABLE "public"."shared_workflow" TO "authenticated";
GRANT ALL ON TABLE "public"."shared_workflow" TO "service_role";



GRANT ALL ON TABLE "public"."tag_entity" TO "anon";
GRANT ALL ON TABLE "public"."tag_entity" TO "authenticated";
GRANT ALL ON TABLE "public"."tag_entity" TO "service_role";



GRANT ALL ON TABLE "public"."test_case_execution" TO "anon";
GRANT ALL ON TABLE "public"."test_case_execution" TO "authenticated";
GRANT ALL ON TABLE "public"."test_case_execution" TO "service_role";



GRANT ALL ON TABLE "public"."test_run" TO "anon";
GRANT ALL ON TABLE "public"."test_run" TO "authenticated";
GRANT ALL ON TABLE "public"."test_run" TO "service_role";



GRANT ALL ON TABLE "public"."token_exchange_jti" TO "anon";
GRANT ALL ON TABLE "public"."token_exchange_jti" TO "authenticated";
GRANT ALL ON TABLE "public"."token_exchange_jti" TO "service_role";



GRANT ALL ON TABLE "public"."trusted_key" TO "anon";
GRANT ALL ON TABLE "public"."trusted_key" TO "authenticated";
GRANT ALL ON TABLE "public"."trusted_key" TO "service_role";



GRANT ALL ON TABLE "public"."trusted_key_source" TO "anon";
GRANT ALL ON TABLE "public"."trusted_key_source" TO "authenticated";
GRANT ALL ON TABLE "public"."trusted_key_source" TO "service_role";



GRANT ALL ON TABLE "public"."user" TO "anon";
GRANT ALL ON TABLE "public"."user" TO "authenticated";
GRANT ALL ON TABLE "public"."user" TO "service_role";



GRANT ALL ON TABLE "public"."user_api_keys" TO "anon";
GRANT ALL ON TABLE "public"."user_api_keys" TO "authenticated";
GRANT ALL ON TABLE "public"."user_api_keys" TO "service_role";



GRANT ALL ON TABLE "public"."user_favorites" TO "anon";
GRANT ALL ON TABLE "public"."user_favorites" TO "authenticated";
GRANT ALL ON TABLE "public"."user_favorites" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_favorites_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_favorites_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_favorites_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."variables" TO "anon";
GRANT ALL ON TABLE "public"."variables" TO "authenticated";
GRANT ALL ON TABLE "public"."variables" TO "service_role";



GRANT ALL ON TABLE "public"."webhook_entity" TO "anon";
GRANT ALL ON TABLE "public"."webhook_entity" TO "authenticated";
GRANT ALL ON TABLE "public"."webhook_entity" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_builder_session" TO "anon";
GRANT ALL ON TABLE "public"."workflow_builder_session" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_builder_session" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_dependency" TO "anon";
GRANT ALL ON TABLE "public"."workflow_dependency" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_dependency" TO "service_role";



GRANT ALL ON SEQUENCE "public"."workflow_dependency_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."workflow_dependency_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."workflow_dependency_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_entity" TO "anon";
GRANT ALL ON TABLE "public"."workflow_entity" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_entity" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_history" TO "anon";
GRANT ALL ON TABLE "public"."workflow_history" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_history" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_publish_history" TO "anon";
GRANT ALL ON TABLE "public"."workflow_publish_history" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_publish_history" TO "service_role";



GRANT ALL ON SEQUENCE "public"."workflow_publish_history_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."workflow_publish_history_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."workflow_publish_history_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_published_version" TO "anon";
GRANT ALL ON TABLE "public"."workflow_published_version" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_published_version" TO "service_role";



GRANT ALL ON TABLE "public"."workflow_statistics" TO "anon";
GRANT ALL ON TABLE "public"."workflow_statistics" TO "authenticated";
GRANT ALL ON TABLE "public"."workflow_statistics" TO "service_role";



GRANT ALL ON SEQUENCE "public"."workflow_statistics_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."workflow_statistics_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."workflow_statistics_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."workflows_tags" TO "anon";
GRANT ALL ON TABLE "public"."workflows_tags" TO "authenticated";
GRANT ALL ON TABLE "public"."workflows_tags" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";



































