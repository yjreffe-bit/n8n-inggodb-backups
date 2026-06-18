SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict hiqxPDGonEv8Gd200FRJU6zwa8iEAGxjidjwf0FYcUmB92elXpsDmSFFChvphWR

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."custom_oauth_providers" ("id", "provider_type", "identifier", "name", "client_id", "client_secret", "acceptable_client_ids", "scopes", "pkce_enabled", "attribute_mapping", "authorization_params", "enabled", "email_optional", "issuer", "discovery_url", "skip_nonce_check", "cached_discovery", "discovery_cached_at", "authorization_url", "token_url", "userinfo_url", "jwks_uri", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at", "invite_token", "referrer", "oauth_client_state_id", "linking_target_id", "email_optional") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_clients" ("id", "client_secret_hash", "registration_type", "redirect_uris", "grant_types", "client_name", "client_uri", "logo_uri", "created_at", "updated_at", "deleted_at", "client_type", "token_endpoint_auth_method") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid", "last_webauthn_challenge_data") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_authorizations" ("id", "authorization_id", "client_id", "user_id", "redirect_uri", "scope", "state", "resource", "code_challenge", "code_challenge_method", "response_type", "status", "authorization_code", "created_at", "expires_at", "approved_at", "nonce") FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_client_states" ("id", "provider_type", "code_verifier", "created_at") FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_consents" ("id", "user_id", "client_id", "scopes", "granted_at", "revoked_at") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at", "disabled") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."webauthn_challenges" ("id", "user_id", "challenge_type", "session_data", "created_at", "expires_at") FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."webauthn_credentials" ("id", "user_id", "credential_id", "public_key", "attestation_type", "aaguid", "sign_count", "transports", "backup_eligible", "backed_up", "friendly_name", "created_at", "updated_at", "last_used_at") FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."role" ("slug", "displayName", "description", "roleType", "systemRole", "createdAt", "updatedAt") FROM stdin;
global:chatUser	Chat User	Chat User	global	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
global:owner	Owner	Owner	global	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:17.092+00
global:admin	Admin	Admin	global	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:17.092+00
global:member	Member	Member	global	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:17.092+00
project:admin	Project Admin	Full control of settings, members, workflows, credentials and executions	project	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:20.183+00
project:personalOwner	Project Owner	Project Owner	project	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:20.183+00
project:editor	Project Editor	Create, edit, and delete workflows, credentials, and executions	project	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:20.183+00
project:viewer	Project Viewer	Read-only access to workflows, credentials, and executions	project	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:20.183+00
project:chatUser	Project Chat User	Chat-only access to chatting with workflows that have n8n Chat enabled	project	t	2026-05-01 00:27:46.926+00	2026-05-01 00:31:20.183+00
credential:owner	Credential Owner	Credential Owner	credential	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
credential:user	Credential User	Credential User	credential	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
workflow:owner	Workflow Owner	Workflow Owner	workflow	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
workflow:editor	Workflow Editor	Workflow Editor	workflow	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
secretsProviderConnection:owner	Secrets Provider Connection Owner	Full control of secrets provider connection settings and secrets	secretsProviderConnection	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
secretsProviderConnection:user	Secrets Provider Connection User	Read-only access to use secrets from the connection	secretsProviderConnection	t	2026-05-01 00:31:14.169+00	2026-05-01 00:31:14.169+00
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user" ("id", "email", "firstName", "lastName", "password", "personalizationAnswers", "createdAt", "updatedAt", "settings", "disabled", "mfaEnabled", "mfaSecret", "mfaRecoveryCodes", "lastActiveAt", "roleSlug") FROM stdin;
fea4af2e-1af7-42db-96f1-90c44eacc092	j_llamas25@yahoo.ca	Jeffrey	Llamas	$2a$10$y4GWXHQgoIyDCVZUWca34.SQggZd7aAVdYkBkI.3GShLdUi2ouIv.	{"version":"v4","personalization_survey_submitted_at":"2026-05-01T00:58:30.154Z","personalization_survey_n8n_version":"2.18.5","automationGoalDevops":["ticketing-systems-integrations","reporting","monitoring-alerting","data-syncing","incident-response"],"companyIndustryExtended":["media-industry","marketing-industry","physical-retail-or-services","manufacturing-industry","real-estate-or-construction","security-industry","telecoms","msp","legal-industry","it-industry","healthcare","government","finance-insurance-industry"],"companySize":"<20","companyType":"other","role":"devops","reportedSource":"youtube"}	2026-05-01 00:21:10.313+00	2026-05-28 19:27:22.889+00	{"userActivated":false,"easyAIWorkflowOnboarded":true}	f	f	U2FsdGVkX18+wqQTjx0dBJKa5m0DsQ0irsvOoUdPCzY1vAhiD9owleubPtHEtEvOgFjCvRx4dXAPeOsx37aQOg==	U2FsdGVkX1+Hz+3XQvM0m3xXrJPjIMJwdvSJl1Ff2OZVtmlIRaciZezqs1b9whs8vBUPoa1wiIBu5qfZcgr2oA==,U2FsdGVkX1+XZaoyoeA/HhdzCPC0xMzGst3THsHl8QjLnz61Eyk4NNh0Yi0zpkB00JqC6IEzE3jTnaMxSrvYuA==,U2FsdGVkX18XaG+uWRWV/P3N+1hcCQMpDhkGjBsxt+Bady35/V9jA8zwn4RY6G+8NoJ3s/T55SRENijGNAIjCQ==,U2FsdGVkX19pzOiulR3PhyW+3EoGPRbD1BHWIDqqCUadrFfTw8G44bqZgCJ8Op+Wc1qqbgalbdYdlmodDCSCzA==,U2FsdGVkX19CWm9efkWIC9FXYz8jrHa8JX5twWdxfRsArcuEKmypEoRsFl7R1HLTof+vVM53pmdTvA+ezwyYiQ==,U2FsdGVkX19kBtsjz4rsfdhve6duC/4KUySts1krgZHaov5mPHmL4VxK9AwQOxzXKV97rjRyNLuuyCgT9A76Hg==,U2FsdGVkX194/NesQMEg1njWZUGdGuN8sWitm9J/3rT2HwF+BHxBYGdtsm4dcyG4tn+QUNWqnNdu7hXY/Fuo/w==,U2FsdGVkX18zd/fq7860GQMnzKnBh1317V8kXase78O3BmdOSOo2TC0UhnmOQ50A6FNvzKjPEJgFox6DfXv2jg==,U2FsdGVkX197wdvDyow2U3YMQACEC1XAESa6xosUx7iVSkspxpX87i4dZcgghF6S+LbgEDo5LilimOrfK12eug==,U2FsdGVkX1/CexUCJfNQAnwxZEsJWQyP/aC3Cy8OFFoYd3Uin1/6Y/J+MJ5+1QYswaw31u8iDH/A6VYnUkpexg==	2026-05-28	global:owner
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."project" ("id", "name", "type", "createdAt", "updatedAt", "icon", "description", "creatorId") FROM stdin;
O0pFdMJSB9FZDT1n	Jeffrey Llamas <j_llamas25@yahoo.ca>	personal	2026-05-01 00:23:04.692+00	2026-05-01 00:56:28.423+00	\N	\N	fea4af2e-1af7-42db-96f1-90c44eacc092
\.


--
-- Data for Name: folder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."folder" ("id", "name", "parentFolderId", "projectId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_ai_threads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_threads" ("id", "resourceId", "title", "metadata", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: workflow_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_entity" ("name", "active", "nodes", "connections", "createdAt", "updatedAt", "settings", "staticData", "pinData", "versionId", "triggerCount", "id", "meta", "parentFolderId", "isArchived", "versionCounter", "description", "activeVersionId") FROM stdin;
Top 10 Videos	f	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[144,960],"id":"c76fb40c-3396-4609-931f-8260037c887e","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,784],"id":"37fb294f-3147-4682-bd1e-14a5c5109e98","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,1040],"id":"deacd850-fcfb-42bc-b304-5eab52c92d19","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[2192,1168],"id":"d51b0ac5-10fb-4cee-84ad-2a3c611be8ba","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[1632,1024],"id":"c29fd93b-f072-446e-ac79-26d37ce9600e","name":"Switch"},{"parameters":{"options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[768,400],"id":"e617050b-e488-4009-afb1-499e472e7976","name":"4o-mini"},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,400],"id":"8d2fa3bd-c502-41e3-bb19-a9727362ab07","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[1152,208],"id":"ebab7405-f7d6-43ef-a1f9-6132110550c7","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[1344,208],"id":"104fb5e6-a6f8-408d-9863-d4667c9de8b6","name":"Loop Over Items"},{"parameters":{"authentication":"serviceAccount","resource":"spreadsheet","operation":"deleteSpreadsheet","documentId":{"__rl":true,"mode":"url","value":"","__regex":"https:\\\\/\\\\/(?:drive|docs)\\\\.google\\\\.com(?:\\\\/.*|)\\\\/d\\\\/([0-9a-zA-Z\\\\-_]+)(?:\\\\/.*|)"}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1552,224],"id":"7904c30b-df0e-41d8-9ad1-5964dfdcf0ee","name":"Add to Sheet","credentials":{"googleApi":{"id":"8TqqxRIs01XpYaLP","name":"Google Sheets account 3"}}},{"parameters":{"documentId":{"__rl":true,"value":"","mode":"list","cachedResultName":"","cachedResultUrl":""},"sheetName":{"__rl":true,"value":"","mode":"list","cachedResultName":"","cachedResultUrl":""}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[368,864],"id":"cbe5f3b0-635a-4a67-9fdb-d240a5698656","name":"Google Sheets","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[560,864],"id":"8c63fc15-9d33-427d-b775-90dc0a658e2a","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[640,1088],"id":"3a6ff176-1e75-4cdf-967d-1c8f624be8ad","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[912,864],"id":"1a1a424b-dad6-480f-954f-0d9b5670fb95","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,1088],"id":"d2bcd3ab-684c-413b-8159-835365a78bae","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1968,720],"id":"be31d495-8a58-4979-92eb-354f74bb617a","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,960],"id":"e8117fc3-eef5-4cef-97cf-54c08860e6e8","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[832,1088],"id":"c89e1cf2-bf31-484d-97fd-49de584385ba","name":"4o"},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[1632,784],"id":"09e3db00-e02e-410c-902c-ccff80f65dfc","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[2192,720],"id":"5d2f8cbf-0d8a-4d1e-bd0c-bf269060b36a","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[2400,720],"id":"5bbf1818-0b87-4ce3-bf95-dca4e8ce1902","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2624,720],"id":"84d05eba-a3ca-4518-87db-4d01c9690d0c","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":11},{"triggerAtHour":14},{"triggerAtHour":18}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,768],"id":"7be40416-8edf-46b5-b44e-1f0fe5f077f5","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":11},{"triggerAtHour":14},{"triggerAtHour":16}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[624,208],"id":"3802b4f6-13ea-402a-a062-6e8ce612f60b","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[544,0],"id":"6abae8c7-a277-48f8-a681-46363bf176b3","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,624],"id":"5111f56f-5c4a-479d-8be7-42f2a470ecb1","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1312,624],"id":"5635d7a8-1b87-4c56-a214-de4a28ba771a","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,624],"id":"28f21373-d79b-48ac-816a-897e63b9b301","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,928],"id":"fab56f98-318c-4a99-9709-80792a9cd697","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,1120],"id":"d6689093-191c-43de-892f-d3a043d4ed50","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,0],"id":"fbe38f01-7435-4c87-a4cf-3dcf488394f4","name":"Sticky Note6"},{"parameters":{"promptType":"define","text":"Generate some ideas","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[3776,416],"id":"75ab7862-6fef-45bd-bfcd-5a543b21cdb8","name":"AI Agent"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets1').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro1').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro1').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro1').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro1').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[4384,992],"id":"74a444fe-5693-4cd0-b5f0-ddcb8b490786","name":"Generate Video1"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video1').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[4384,1248],"id":"c498e77b-f979-4389-9eca-b975a840002c","name":"Get Video1"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[5168,1376],"id":"7cfe0ace-7c66-43a6-a9bb-46a0020ed2f3","name":"10 Secs1","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[4608,1232],"id":"652412c3-f0ab-44e4-84db-f96d52d50782","name":"Switch1"},{"parameters":{"options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[3744,608],"id":"7514fd11-3caf-47a3-833e-3ae901d0cddc","name":"4o-mini1"},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[3984,608],"id":"0854e48b-444a-4d91-a6ba-11015d32d61f","name":"Structured Output Parser1"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[4128,416],"id":"eef4ec8e-87de-494b-8053-7924e7f8545a","name":"Split Out1"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[4320,416],"id":"6299cf47-416c-4636-823e-c6e79bd8f174","name":"Loop Over Items1"},{"parameters":{"operation":"append","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $json['output.topTenSubjects'] }}","Creation Status":"To Do","Posting Status":"To Do"},"matchingColumns":[],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[4528,432],"id":"1b4f0845-e70c-40a7-8e76-844155795e29","name":"Add to Sheet1"},{"parameters":{"documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"filtersUI":{"values":[{"lookupColumn":"Creation Status","lookupValue":"To Do"}]},"options":{"returnFirstMatch":true}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[3344,1072],"id":"0fa539a8-79fc-496b-b446-84166c2a55e5","name":"Google Sheets1"},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[3536,1072],"id":"248f3e06-7b4e-4abb-b5c9-ba525dc46202","name":"Intro & Outro1"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[3616,1296],"id":"06cb6d3b-4236-4e37-99af-2ef05f6ad1dd","name":"Intro & Outro Parser1"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets1').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[3888,1072],"id":"b00b75c8-0085-4484-960f-d3067546185d","name":"Ranker1"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[3984,1296],"id":"3f138f78-e78e-43a9-b2a7-6af930a0c668","name":"Rankings1"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets1').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video1').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[4944,928],"id":"b59dce80-9e8d-4056-ae48-24aa657e9a4d","name":"Created Video1"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets1').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[5168,1168],"id":"bd34cccf-dd52-4da4-821f-d33965bd95ff","name":"Error1"},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[3808,1296],"id":"7bd5b661-ae0e-4ee6-b8da-c88eb4b93dc1","name":"4o1"},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[4608,992],"id":"58b382bc-8923-4fce-9bba-04fd0800533e","name":"150 Secs1","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video1').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[5168,928],"id":"e2f37dd3-0a7b-434b-8c56-ea348bee6664","name":"Download Video1"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video1').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video1').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[5376,928],"id":"87c9394d-88c6-4057-9243-88901ce9bb55","name":"YouTube1"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets1').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[5600,928],"id":"fd05c140-9371-4246-b0a7-1fd8df03f733","name":"Update Sheet1"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[3120,976],"id":"a0c1a04a-71ea-46e9-afb5-28f9e6cfb3ec","name":"Schedule Trigger2"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[3600,416],"id":"f795582b-a89f-44cf-9253-933a52666bce","name":"Schedule Trigger3"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[3520,208],"id":"d44de70e-6498-484a-816d-13c78a460e91","name":"Sticky Note7"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[2976,832],"id":"232adaf1-eb9a-41d1-bd39-27399b6437db","name":"Sticky Note8"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4288,832],"id":"693539b6-2200-4ff0-bb04-6a6c36d372a4","name":"Sticky Note9"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4816,832],"id":"8b7943cf-ac9c-4758-85be-707b282e3ece","name":"Sticky Note10"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4816,1136],"id":"0efc3757-4216-435a-8120-3fe7d1701baf","name":"Sticky Note11"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4816,1328],"id":"c564ac29-a0f3-4718-a8a7-5ced93cc4cb0","name":"Sticky Note12"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[2976,208],"id":"4e6d4208-dfb1-480b-b04e-6e23d277baa7","name":"Sticky Note13"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[]]},"Structured Output Parser":{"ai_outputParser":[[]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Add to Sheet","type":"main","index":0}]]},"Add to Sheet":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[]]},"AI Agent":{"main":[[{"node":"Split Out1","type":"main","index":0}]]},"Generate Video1":{"main":[[{"node":"150 Secs1","type":"main","index":0}]]},"Get Video1":{"main":[[{"node":"Switch1","type":"main","index":0}]]},"10 Secs1":{"main":[[{"node":"Get Video1","type":"main","index":0}]]},"Switch1":{"main":[[{"node":"Created Video1","type":"main","index":0}],[{"node":"Error1","type":"main","index":0}],[{"node":"10 Secs1","type":"main","index":0}],[{"node":"10 Secs1","type":"main","index":0}]]},"4o-mini1":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"Structured Output Parser1":{"ai_outputParser":[[{"node":"AI Agent","type":"ai_outputParser","index":0}]]},"Split Out1":{"main":[[{"node":"Loop Over Items1","type":"main","index":0}]]},"Loop Over Items1":{"main":[[],[{"node":"Add to Sheet1","type":"main","index":0}]]},"Add to Sheet1":{"main":[[{"node":"Loop Over Items1","type":"main","index":0}]]},"Google Sheets1":{"main":[[{"node":"Intro & Outro1","type":"main","index":0}]]},"Intro & Outro1":{"main":[[{"node":"Ranker1","type":"main","index":0}]]},"Intro & Outro Parser1":{"ai_outputParser":[[{"node":"Intro & Outro1","type":"ai_outputParser","index":0}]]},"Ranker1":{"main":[[{"node":"Generate Video1","type":"main","index":0}]]},"Rankings1":{"ai_outputParser":[[{"node":"Ranker1","type":"ai_outputParser","index":0}]]},"Created Video1":{"main":[[{"node":"Download Video1","type":"main","index":0}]]},"4o1":{"ai_languageModel":[[{"node":"Intro & Outro1","type":"ai_languageModel","index":0},{"node":"Ranker1","type":"ai_languageModel","index":0}]]},"150 Secs1":{"main":[[{"node":"Get Video1","type":"main","index":0}]]},"Download Video1":{"main":[[{"node":"YouTube1","type":"main","index":0}]]},"YouTube1":{"main":[[{"node":"Update Sheet1","type":"main","index":0}]]},"Schedule Trigger2":{"main":[[{"node":"Google Sheets1","type":"main","index":0}]]},"Schedule Trigger3":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	2026-05-01 21:43:52.214+00	2026-05-02 20:03:09.056+00	{"executionOrder":"v1","binaryMode":"separate","availableInMCP":false}	\N	{}	f0ef2ef0-d483-42a0-a3b1-c086e2ad2829	0	4PeZJJxDMiJE6tcE	{"templateCredsSetupCompleted":true}	\N	t	118	\N	\N
Top 10 Videos	f	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[144,960],"id":"228711ee-8af9-4c9f-bafe-993937fd1a85","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,784],"id":"9f9547f3-b60f-4268-b983-45f92a3c02b2","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,1040],"id":"436a4e0c-1904-484b-9221-efe01738d17b","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[2192,1168],"id":"347f283b-62fd-4cc7-ad3e-e42820208766","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[1632,1024],"id":"159d0c90-3a97-416f-acef-16c696ae29a6","name":"Switch"},{"parameters":{"hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[800,208],"id":"f500ac03-1e7b-44a3-8fce-2a3fce70da67","name":"AI Agent"},{"parameters":{"model":"=openrouter/auto","options":{"maxTokens":-1}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[768,400],"id":"c45d7065-3697-4f05-bea2-fad67813ab2a","name":"4o-mini","credentials":{"openRouterApi":{"id":"GnfbzlFRwyF3J707","name":"OpenRouter account"}}},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,400],"id":"b153c809-5694-4c07-b058-cc6e4e331610","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[1152,208],"id":"1f47200d-aa7c-4124-b90c-95c68bd7e94c","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[1344,208],"id":"fb307152-d414-45b7-bafd-e1b921aa57f8","name":"Loop Over Items"},{"parameters":{"resource":"spreadsheet","options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1552,224],"id":"9397b175-bafb-449f-bf4c-0403fe1f9641","name":"Add to Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"resource":"spreadsheet","options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[368,864],"id":"48361bce-1819-4f0e-bf45-2af52bc8d5a5","name":"Google Sheets"},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[560,864],"id":"e2c9bbb2-7588-49da-85a0-77a008c47725","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[640,1088],"id":"12ae07a3-3bae-4daa-b57e-c6de1b49f8f0","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[912,864],"id":"6d9659a8-d183-4398-b507-70bd5609fbe3","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,1088],"id":"7f32a346-8939-49be-b4b8-fe1b910db180","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1968,720],"id":"b4ab837e-af38-4770-a410-0877f80f8d42","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,960],"id":"e21806c0-beec-4323-9149-2eb1f289dde2","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[832,1088],"id":"5a9f72ab-6b7e-4871-9920-d97c0699d227","name":"4o","credentials":{"openRouterApi":{"id":"GnfbzlFRwyF3J707","name":"OpenRouter account"}}},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[1632,784],"id":"f5bbf69b-9f2d-4d91-8859-bf98b8597d64","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[2192,720],"id":"018022e4-032d-4996-8199-49378d8889b5","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[2400,720],"id":"8c0fb31a-b4f7-46e7-9b5b-56ebe5824b7d","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2624,720],"id":"4e2ca846-7527-4ce1-9d75-7769ac322ccd","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,768],"id":"7071fda2-e88f-4614-9300-004fea9cb2e7","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[624,208],"id":"abcab5cb-488e-4cbb-9085-1bfdf7340525","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[544,0],"id":"b5721ae0-7ab4-410b-8ef6-25eef803d013","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,624],"id":"4fc67682-64da-4b0c-8f36-9e2e599d5a04","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1312,624],"id":"a3dec4ad-cfbc-4fb8-b34e-5c580a2d1935","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,624],"id":"97cee90d-3401-4917-8f2b-f8f7bb542688","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,928],"id":"d839b37f-44c5-4091-8084-27e41555ca03","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,1120],"id":"5b5299b4-9f9f-4ce9-8fbe-0b1a2f07bff4","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,0],"id":"6a0d9215-3041-4c09-9164-574266219e7d","name":"Sticky Note6"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"AI Agent":{"main":[[{"node":"Split Out","type":"main","index":0}]]},"Structured Output Parser":{"ai_outputParser":[[{"node":"AI Agent","type":"ai_outputParser","index":0}]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Add to Sheet","type":"main","index":0}]]},"Add to Sheet":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	2026-05-02 16:02:07.246+00	2026-05-02 20:05:21.158+00	{"executionOrder":"v1","binaryMode":"separate"}	\N	{}	4ade281b-1c9a-44a2-930b-cbcbbfee06c2	0	aHPyQ2bgeu7Ilrbd	\N	\N	t	19	\N	\N
Top 10 Videos	f	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[144,960],"id":"641476a6-77e3-4fd6-8d55-22057f09a8c4","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1296,864],"id":"f8990e5b-3620-4639-b6c2-c32e28e449d3","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1744,864],"id":"0d585371-0f9f-4e09-a45e-532185c78c88","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[2192,960],"id":"71442215-1773-48e1-8dff-701131de023a","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[1968,736],"id":"ed4550ab-a0f1-455f-8cd2-1be6933df6b4","name":"Switch"},{"parameters":{"promptType":"define","text":"Generate some ideas","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[368,208],"id":"d317033c-f2cc-4ade-9dcb-277bf2571763","name":"AI Agent"},{"parameters":{"options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[376,432],"id":"1163554c-9ff7-4b6a-a658-12e83d23c797","name":"4o-mini"},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[504,432],"id":"074556e5-0cb3-431d-b11f-3b398aa47aaa","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[720,208],"id":"1fccc321-ef70-4fdd-8614-e23ae57455bd","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[944,208],"id":"d43a365a-c9d0-47f7-8835-53103ab57af3","name":"Loop Over Items"},{"parameters":{"documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"filtersUI":{"values":[{"lookupColumn":"Creation Status","lookupValue":"To Do"}]},"options":{"returnFirstMatch":true}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[368,864],"id":"36620307-9c3a-4b8a-98a8-82306e6094d6","name":"Google Sheets","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[592,864],"id":"1f8f2567-eca2-4336-84c4-d921d880882e","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[728,1088],"id":"1f8300c1-77b8-49ad-b025-0774914db3bb","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[944,864],"id":"6a409028-8068-4884-ad76-57923c820b9a","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1016,1088],"id":"d46a300a-3d03-4aa4-b0e8-78b76c44ec3b","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,536],"id":"60fdd57f-36b7-4f79-9a9d-4714072e244b","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,728],"id":"11f45b80-4a78-4756-9217-37af69058647","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[600,1088],"id":"3233df7e-7ca0-43a7-9932-f55673ad7ccf","name":"4o"},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[1520,864],"id":"5fc5d48f-fa2e-42ae-9794-aaf07d318256","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[2416,536],"id":"5e63c4fd-3538-40f2-a5a9-a8f7820c955a","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[2640,536],"id":"dc5c3be5-32e6-4be9-9fbd-f0689beb5c13","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2864,536],"id":"6ce0ebdb-7777-4090-bc8f-951a8108bcbd","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,768],"id":"09517f4f-2f2c-421a-b736-85f150a46d59","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,208],"id":"36a90d85-93ed-4c7f-8d3b-64476655a1ad","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[64,-24],"id":"542b67ca-d6e3-44c8-95cc-5bdb1625fd87","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[16,552],"id":"75466c3b-7939-4d5d-b961-0da73c785bf9","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1420,344],"id":"aee90aea-f785-4223-b2dc-fdbed5b15fa4","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[2066,416],"id":"5987e031-f839-4d3c-a3c2-b0448a16bc4f","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1890,708],"id":"4d94755b-a17e-467a-9fbf-13de06164f36","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1890,940],"id":"3ff9f7c0-c67e-4be3-8898-94f6b09319b9","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,0],"id":"859f2708-de78-47c6-ae07-3dd5a48a5654","name":"Sticky Note6"},{"parameters":{"workflowId":{"__rl":true,"value":"hJdXYdSDA8pMnD5H","mode":"list"},"workflowInputs":{"mappingMode":"defineBelow","value":{},"matchingColumns":[],"schema":[],"attemptToConvertTypes":false,"convertFieldsToString":true},"options":{}},"type":"n8n-nodes-base.executeWorkflow","typeVersion":1.2,"position":[1168,208],"name":"Call My Sub-workflow","id":"c3320576-ec48-40ac-a3e1-342f20c357b0"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"AI Agent":{"main":[[{"node":"Split Out","type":"main","index":0}]]},"Structured Output Parser":{"ai_outputParser":[[{"node":"AI Agent","type":"ai_outputParser","index":0}]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Call My Sub-workflow","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[{"node":"AI Agent","type":"main","index":0}]]},"Call My Sub-workflow":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]}}	2026-05-01 23:27:35.77+00	2026-05-02 20:05:37.509+00	{"executionOrder":"v1","binaryMode":"separate"}	\N	{}	cdb1ea68-1896-4246-a3be-713dc82491e9	0	nv4NgSzjmvBxdIjO	{"templateCredsSetupCompleted":true}	\N	t	13	\N	\N
My Sub-workflow	f	[{"parameters":{"authentication":"oAuth2","resource":"sheet","operation":"create","documentId":{"__rl":true,"value":"","mode":"list","cachedResultName":"","cachedResultUrl":""},"title":"n8n-sheet","options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1552,224],"id":"e64af857-c1a4-4c4d-8fbd-28fe29afd64a","name":"Add to Sheet","issues":{"parameters":{"documentId":["Parameter \\"Document\\" is required."]}},"credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"},"googleApi":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}},"alwaysOutputData":true,"executeOnce":true,"retryOnFail":true},{"id":"29a21ebb-8c71-4cb0-893b-90a348312221","typeVersion":1.1,"name":"Start","type":"n8n-nodes-base.executeWorkflowTrigger","position":[1344,224],"parameters":{"inputSource":"passthrough"}}]	{"Start":{"main":[[{"node":"Add to Sheet","type":"main","index":0}]]}}	2026-05-02 16:00:58.73+00	2026-05-02 20:05:41.013+00	{"executionOrder":"v1","availableInMCP":false}	\N	\N	52f79888-ec23-4c40-87b9-edb8c8c8cd71	0	hJdXYdSDA8pMnD5H	\N	\N	t	2	\N	\N
My Sub-Workflow 1	f	[{"id":"c055762a-8fe7-4141-a639-df2372f30060","typeVersion":1.1,"name":"When Executed by Another Workflow","type":"n8n-nodes-base.executeWorkflowTrigger","position":[260,340],"parameters":{}},{"id":"b5942df6-0160-4ef7-965d-57583acdc8aa","name":"Replace me with your logic","type":"n8n-nodes-base.noOp","position":[520,340],"parameters":{}}]	{"When Executed by Another Workflow":{"main":[[{"node":"Replace me with your logic","type":"main","index":0}]]}}	2026-05-02 06:21:00.473+00	2026-05-02 20:05:44.213+00	{"executionOrder":"v1","availableInMCP":false}	\N	{}	b71f2957-0848-4e4c-b9fd-1631cc2eed13	0	1UIy7q3UXi42x3ry	\N	\N	t	2	\N	\N
AI agent chat	f	[{"parameters":{"options":{}},"id":"ef4c6982-f746-4d48-944b-449f8bdbb69f","name":"When chat message received","type":"@n8n/n8n-nodes-langchain.chatTrigger","position":[368,240],"webhookId":"53c136fe-3e77-4709-a143-fe82746dd8b6","typeVersion":1.1},{"parameters":{},"id":"e6183978-5077-4252-9718-6b36b6a7cd74","name":"Simple Memory","type":"@n8n/n8n-nodes-langchain.memoryBufferWindow","position":[720,464],"typeVersion":1.3},{"parameters":{"model":{"__rl":true,"mode":"list","value":"gpt-4o-mini"},"options":{}},"id":"1719e956-f9c8-48f5-9744-ee62345a9f7d","name":"OpenAI Chat Model","type":"@n8n/n8n-nodes-langchain.lmChatOpenAi","position":[576,464],"typeVersion":1.2},{"parameters":{"options":{}},"id":"f0815af7-da61-4863-9cfa-b35be836b59c","name":"SerpAPI","type":"@n8n/n8n-nodes-langchain.toolSerpApi","position":[848,464],"typeVersion":1},{"parameters":{"options":{}},"id":"2d3b4012-bd5f-46d5-be6d-af1ede6c155b","name":"AI Agent","type":"@n8n/n8n-nodes-langchain.agent","position":[608,240],"typeVersion":1.8}]	{"SerpAPI":{"ai_tool":[[{"node":"AI Agent","type":"ai_tool","index":0}]]},"Simple Memory":{"ai_memory":[[{"node":"AI Agent","type":"ai_memory","index":0}]]},"OpenAI Chat Model":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"When chat message received":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	2026-05-02 17:08:13.031+00	2026-05-02 20:05:29.041+00	{"executionOrder":"v1","binaryMode":"separate"}	\N	{}	45c09d69-21d4-49b4-b2b1-1a6c81f4d25d	0	n04q3jqDCHcgYArg	{"templateId":"1954"}	\N	t	2	\N	\N
Generate AI videos with Google Veo3, save to Google Drive and upload to YouTube	f	[{"parameters":{},"id":"3941733f-a23d-402b-ab3d-32f1f3f0d6a9","name":"When clicking ‘Test workflow’","type":"n8n-nodes-base.manualTrigger","position":[368,1552],"typeVersion":1},{"parameters":{"url":"=https://queue.fal.run/fal-ai/veo3/requests/{{ $('Create Video').item.json.request_id }}/status ","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","options":{}},"id":"b66a0e84-845a-4739-9ca2-f2dd97b5a8de","name":"Get status","type":"n8n-nodes-base.httpRequest","position":[1440,1552],"typeVersion":4.2},{"parameters":{"amount":60},"id":"667a3af5-08dc-4b05-a5f9-76d24f0d64cc","name":"Wait 60 sec.","type":"n8n-nodes-base.wait","position":[1248,1552],"webhookId":"490facb8-d0ae-402e-ab59-a87720cf0bdd","typeVersion":1.1},{"parameters":{"rule":{"interval":[{"field":"minutes"}]}},"id":"81e4cec5-85a8-476e-9813-70e7cf85129c","name":"Schedule Trigger","type":"n8n-nodes-base.scheduleTrigger","position":[368,1408],"typeVersion":1.2},{"parameters":{"content":"# Generate AI Videos with Google Veo3, Save to Google Drive and Upload to YouTube\\n\\nThis workflow allows users to **generate AI videos** using **Google Veo3**, save them to **Google Drive**, generate optimized YouTube titles with GPT-4o, and **automatically upload them to YouTube** . The entire process is triggered from a Google Sheet that acts as the central interface for input and output.\\n\\nIT automates video creation, uploading, and tracking, ensuring seamless integration between Google Sheets, Google Drive, Google Veo3, and YouTube.\\n\\n\\n\\n\\n","height":280,"width":740,"color":3},"id":"9f6296c0-f1f5-4984-b94d-cc160ab37cbf","name":"Sticky Note3","type":"n8n-nodes-base.stickyNote","position":[368,240],"typeVersion":1},{"parameters":{"content":"## STEP 1 - GOOGLE SHEET\\nCreate a [Google Sheet like this](https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=sharing).\\n\\nPlease insert:\\n- in the \\"PROMPT\\" column the accurate description of the video you want to create\\n- in the \\"DURATION\\" column the lenght of the video you want to create\\n\\nLeave the \\"VIDEO\\" column unfilled. It will be inserted by the system once the video has been created","height":200,"width":740},"id":"9f6fa130-128d-4171-9fc7-78d800008580","name":"Sticky Note4","type":"n8n-nodes-base.stickyNote","position":[368,560],"typeVersion":1},{"parameters":{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"combinator":"and","conditions":[{"id":"383d112e-2cc6-4dd4-8985-f09ce0bd1781","operator":{"name":"filter.operator.equals","type":"string","operation":"equals"},"leftValue":"={{ $json.status }}","rightValue":"COMPLETED"}]},"options":{}},"id":"0e20e92c-55b2-4e44-a519-2ee54b1b8c69","name":"Completed?","type":"n8n-nodes-base.if","position":[1616,1552],"typeVersion":2.2},{"parameters":{"operation":"update","documentId":{"__rl":true,"mode":"list","value":"1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=drivesdk","cachedResultName":"Video Google Veo3"},"sheetName":{"__rl":true,"mode":"list","value":"gid=0","cachedResultUrl":"https://docs.google.com/spreadsheets/d/11ebWJvwwXHgvQld9kxywKQUvIoBw6xMa0g0BuIqHDxE/edit#gid=0","cachedResultName":"Foglio1"},"columns":{"value":{"VIDEO":"={{ $('Get Url Video').item.json.video.url }}","row_number":"={{ $('Get new video').item.json.row_number }}"},"schema":[{"id":"PROMPT","type":"string","display":true,"removed":false,"required":false,"displayName":"PROMPT","defaultMatch":false,"canBeUsedToMatch":true},{"id":"DURATION","type":"string","display":true,"removed":false,"required":false,"displayName":"DURATION","defaultMatch":false,"canBeUsedToMatch":true},{"id":"VIDEO","type":"string","display":true,"removed":false,"required":false,"displayName":"VIDEO","defaultMatch":false,"canBeUsedToMatch":true},{"id":"YOUTUBE_URL","type":"string","display":true,"removed":false,"required":false,"displayName":"YOUTUBE_URL","defaultMatch":false,"canBeUsedToMatch":true},{"id":"row_number","type":"string","display":true,"removed":false,"readOnly":true,"required":false,"displayName":"row_number","defaultMatch":false,"canBeUsedToMatch":true}],"mappingMode":"defineBelow","matchingColumns":["row_number"],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"id":"d46e0303-eb0b-4d4f-9bf9-c61e1d577265","name":"Update result","type":"n8n-nodes-base.googleSheets","position":[1456,1808],"typeVersion":4.5},{"parameters":{"assignments":{"assignments":[{"id":"c713d31f-9abd-496a-ac79-e8e2efe60aa0","name":"prompt","type":"string","value":"={{ $json.PROMPT }}\\n\\nDuration of the video: {{ $json.DURATION }}"}]},"options":{}},"id":"4954542f-171a-4eb3-a038-7c941052a770","name":"Set data","type":"n8n-nodes-base.set","position":[816,1552],"typeVersion":3.4},{"parameters":{"content":"## STEP 4 - MAIN FLOW\\nStart the workflow manually or periodically by hooking the \\"Schedule Trigger\\" node. It is recommended to set it at 5 minute intervals.","height":100,"width":740},"id":"e8db1b31-21fa-4b1e-9c98-eeb965a82af1","name":"Sticky Note5","type":"n8n-nodes-base.stickyNote","position":[368,1232],"typeVersion":1},{"parameters":{"content":"## STEP 2 - GET API KEY (YOURAPIKEY)\\nCreate an account [here](https://fal.ai/) and obtain API KEY.\\nIn the node \\"Create Image\\" set \\"Header Auth\\" and set:\\n- Name: \\"Authorization\\"\\n- Value: \\"Key YOURAPIKEY\\"","height":140,"width":740},"id":"2d1603f0-8c89-4fe7-b058-7e22c9cf9bfb","name":"Sticky Note6","type":"n8n-nodes-base.stickyNote","position":[368,800],"typeVersion":1},{"parameters":{"content":"Set API Key created in Step 2","height":200,"width":180},"id":"4ec2b087-e0ae-49ab-9ba2-cd7e3d5563ef","name":"Sticky Note7","type":"n8n-nodes-base.stickyNote","position":[992,1488],"typeVersion":1},{"parameters":{"documentId":{"__rl":true,"mode":"list","value":"1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=drivesdk","cachedResultName":"Video Google Veo3"},"sheetName":{"__rl":true,"mode":"list","value":"gid=0","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit#gid=0","cachedResultName":"Foglio1"},"filtersUI":{"values":[{"lookupColumn":"VIDEO"}]},"options":{}},"id":"a8314ad2-949f-476d-92e9-9408fcf20463","name":"Get new video","type":"n8n-nodes-base.googleSheets","position":[592,1552],"typeVersion":4.5},{"parameters":{"method":"POST","url":"https://queue.fal.run/fal-ai/veo3","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendHeaders":true,"headerParameters":{"parameters":[{"name":"Content-Type","value":"application/json"}]},"sendBody":true,"specifyBody":"json","jsonBody":"={\\n     \\"prompt\\": \\"{{$json.prompt}}\\"\\n}","options":{}},"id":"c0aca14a-194e-4cec-aaed-084e78486a36","name":"Create Video","type":"n8n-nodes-base.httpRequest","position":[1040,1552],"typeVersion":4.2},{"parameters":{"url":"=https://queue.fal.run/fal-ai/veo3/requests/{{ $json.request_id }}","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","options":{}},"id":"64990394-1d99-470a-82db-42174c59ac95","name":"Get Url Video","type":"n8n-nodes-base.httpRequest","position":[368,1920],"typeVersion":4.2},{"parameters":{"url":"={{ $('Get Url Video').item.json.video.url }}","options":{}},"id":"8fddedcd-1d0b-43c9-8001-1b006ff02451","name":"Get File Video","type":"n8n-nodes-base.httpRequest","position":[992,1920],"typeVersion":4.2},{"parameters":{"name":"={{ $now.format('yyyyLLddHHmmss') }}-{{ $('Get Url Video').item.json.video.file_name }}","driveId":{"__rl":true,"mode":"list","value":"My Drive"},"folderId":{"__rl":true,"mode":"list","value":"1aHRwLWyrqfzoVC8HoB-YMrBvQ4tLC-NZ","cachedResultUrl":"https://drive.google.com/drive/folders/1aHRwLWyrqfzoVC8HoB-YMrBvQ4tLC-NZ","cachedResultName":"Fal.run"},"options":{}},"id":"abc5ec3b-dcf4-486b-9368-17216bfcaae7","name":"Upload Video","type":"n8n-nodes-base.googleDrive","position":[1280,1808],"typeVersion":3},{"parameters":{"method":"POST","url":"https://api.upload-post.com/api/upload","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"contentType":"multipart-form-data","bodyParameters":{"parameters":[{"name":"title","value":"={{ $('Generate title').item.json.message.content }}"},{"name":"user","value":"YOUR_USERNAME"},{"name":"platform[]","value":"youtube"},{"parameterType":"formBinaryData","name":"video","inputDataFieldName":"data"}]},"options":{}},"id":"afeac8db-be1b-422b-9c2d-de150083de90","name":"HTTP Request","type":"n8n-nodes-base.httpRequest","position":[1280,2032],"typeVersion":4.2},{"parameters":{"modelId":{"__rl":true,"mode":"list","value":"gpt-4o-mini","cachedResultName":"GPT-4O-MINI"},"messages":{"values":[{"content":"=Input: {{ $('Get new video').item.json.PROMPT }}"},{"content":"You are a YouTube SEO expert specialized in creating engaging and optimized titles.\\n\\nYour task is to generate an effective title for a YouTube video based on the user's video description.\\n\\nGUIDELINES:\\n- Maximum 60 characters to avoid truncation\\n- Use relevant keywords for SEO\\n- Make the title catchy and clickable\\n- Avoid excessive or misleading clickbait\\n- Consider the target audience of the content\\n- Use numbers, questions, or power words when appropriate\\n- IMPORTANT: Generate the title in the same language as the input description\\n\\nOUTPUT FORMAT:\\nProvide only the title, without additional explanations.\\n\\nEXAMPLE:\\nInput: \\"Tutorial video on how to cook perfect pasta carbonara\\"\\nOutput: \\"PERFECT Carbonara in 10 Minutes - Chef's Secrets\\"","role":"system"}]},"options":{}},"id":"0328a4d1-198b-4ae0-a27e-5e9a39b6a5c3","name":"Generate title","type":"@n8n/n8n-nodes-langchain.openAi","position":[608,1920],"typeVersion":1.8},{"parameters":{"operation":"update","documentId":{"__rl":true,"mode":"list","value":"1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=drivesdk","cachedResultName":"Video Google Veo3"},"sheetName":{"__rl":true,"mode":"list","value":"gid=0","cachedResultUrl":"https://docs.google.com/spreadsheets/d/11ebWJvwwXHgvQld9kxywKQUvIoBw6xMa0g0BuIqHDxE/edit#gid=0","cachedResultName":"Foglio1"},"columns":{"value":{"VIDEO":"=","row_number":"={{ $('Get new video').item.json.row_number }}","YOUTUBE_URL":"https://youtu.be/{{ $json.results.youtube.video_id }}"},"schema":[{"id":"PROMPT","type":"string","display":true,"removed":false,"required":false,"displayName":"PROMPT","defaultMatch":false,"canBeUsedToMatch":true},{"id":"DURATION","type":"string","display":true,"removed":false,"required":false,"displayName":"DURATION","defaultMatch":false,"canBeUsedToMatch":true},{"id":"VIDEO","type":"string","display":true,"removed":false,"required":false,"displayName":"VIDEO","defaultMatch":false,"canBeUsedToMatch":true},{"id":"YOUTUBE_URL","type":"string","display":true,"removed":false,"required":false,"displayName":"YOUTUBE_URL","defaultMatch":false,"canBeUsedToMatch":true},{"id":"row_number","type":"string","display":true,"removed":false,"readOnly":true,"required":false,"displayName":"row_number","defaultMatch":false,"canBeUsedToMatch":true}],"mappingMode":"defineBelow","matchingColumns":["row_number"],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"id":"32ef6c52-e7c8-46bd-94dc-9a68c1b64a9f","name":"Update Youtube URL","type":"n8n-nodes-base.googleSheets","position":[1456,2032],"typeVersion":4.5},{"parameters":{"content":"Set YOUR_USERNAME in Step 3","height":200,"width":180},"id":"3c92c864-b015-42c8-92d1-44c6826346db","name":"Sticky Note","type":"n8n-nodes-base.stickyNote","position":[1248,1968],"typeVersion":1},{"parameters":{"content":"## STEP 3 - Upload video on Youtube\\n- Find your API key in your [Upload-Post Manage Api Keys](https://www.upload-post.com/?linkId=lp_144414&sourceId=n3witalia&tenantId=upload-post-app) 10 FREE uploads per month\\n- Set the the \\"Auth Header\\":\\n-- Name: Authorization\\n-- Value: Apikey YOUR_API_KEY_HERE\\n- Create profiles to manage your social media accounts. The \\"Profile\\" you choose will be used in the field YOUR_USRNAME (eg. test1 or test2).  ","height":200,"width":740},"id":"caa2ae49-c800-4403-9ef0-88403b466d69","name":"Sticky Note8","type":"n8n-nodes-base.stickyNote","position":[368,992],"typeVersion":1},{"parameters":{"content":"## MY NEW YOUTUBE CHANNEL\\n👉 [Subscribe to my new **YouTube channel**](https://youtube.com/@n3witalia). Here I’ll share videos and Shorts with practical tutorials and **FREE templates for n8n**.\\n\\n[![image](https://n3wstorage.b-cdn.net/n3witalia/youtube-n8n-cover.jpg)](https://youtube.com/@n3witalia)","height":736,"width":736,"color":7},"id":"573eb0dc-69ee-4707-a054-1fe6eaf6449d","name":"Sticky Note9","type":"n8n-nodes-base.stickyNote","position":[1152,592],"typeVersion":1}]	{"Set data":{"main":[[{"node":"Create Video","type":"main","index":0}]]},"Completed?":{"main":[[{"node":"Get Url Video","type":"main","index":0}],[{"node":"Wait 60 sec.","type":"main","index":0}]]},"Get status":{"main":[[{"node":"Completed?","type":"main","index":0}]]},"Create Video":{"main":[[{"node":"Wait 60 sec.","type":"main","index":0}]]},"HTTP Request":{"main":[[{"node":"Update Youtube URL","type":"main","index":0}]]},"Upload Video":{"main":[[{"node":"Update result","type":"main","index":0}]]},"Wait 60 sec.":{"main":[[{"node":"Get status","type":"main","index":0}]]},"Get Url Video":{"main":[[{"node":"Generate title","type":"main","index":0}]]},"Get new video":{"main":[[{"node":"Set data","type":"main","index":0}]]},"Generate title":{"main":[[{"node":"Get File Video","type":"main","index":0}]]},"Get File Video":{"main":[[{"node":"Upload Video","type":"main","index":0},{"node":"HTTP Request","type":"main","index":0}]]},"When clicking ‘Test workflow’":{"main":[[{"node":"Get new video","type":"main","index":0}]]}}	2026-05-01 23:38:32.977+00	2026-05-02 20:05:47.319+00	{"executionOrder":"v1","binaryMode":"separate"}	\N	{}	aaa76421-9104-42fe-b60e-0d8e6d20f4de	0	bbsdId4xX7PFvnn6	{"templateId":"4846"}	\N	t	2	\N	\N
Top 10 Videos	f	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[-1712,256],"id":"351e47da-99aa-4f1d-8036-1eca28cfcc97","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[-560,160],"id":"304019d1-9ee4-4ea1-8674-e5591b7d628a","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[-112,160],"id":"426a34de-258e-4d18-9edb-905d50ce147a","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[336,256],"id":"63f2b31d-5a17-48a0-b883-69e007530b6d","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[112,32],"id":"1d6f6042-83c0-4fad-a039-ee76673e5875","name":"Switch"},{"parameters":{"promptType":"define","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation.","maxIterations":10}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[-1488,-704],"id":"542f9843-c3e8-428b-8ba7-3784f7b09464","name":"AI Agent"},{"parameters":{"model":"openrouter/free","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[-1416,-480],"id":"ff5c2868-e733-4bae-afe2-df30a4ca24b0","name":"4o-mini","credentials":{"openRouterApi":{"id":"Lwm7OCNgUYON0Xsb","name":"OpenRouter account"}}},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[-1712,-376],"id":"6189c5f4-2cb3-4497-b817-558dc53e467b","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[-1136,-704],"id":"bf79bd71-5e99-41d6-b552-0b78f3536986","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[-912,-704],"id":"ccb3cf89-de70-4842-ba86-e2f3c187f31e","name":"Loop Over Items"},{"parameters":{"documentId":{"__rl":true,"mode":"list","value":""},"sheetName":{"__rl":true,"mode":"list","value":""}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[-688,-704],"id":"fd3b02d8-dbcc-43b3-a59c-98f97cbf1ec3","name":"Add to Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"filtersUI":{"values":[{"lookupColumn":"Creation Status","lookupValue":"To Do"}]},"options":{"returnFirstMatch":true}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[-1488,160],"id":"efd37d37-ebfb-499c-862a-f612a67d496b","name":"Google Sheets","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[-1264,160],"id":"0d2dd5de-1bb1-464d-82f6-f374cc09dff0","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[-1128,384],"id":"2dd7170b-f88c-42c6-812d-21d2a8732f1f","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[-912,160],"id":"52d81623-6c09-4a29-a312-51d7103dc12b","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[-840,384],"id":"74305372-0d03-44d2-a416-fa1708954dc9","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[336,-168],"id":"6dc624fe-71e8-4e5d-9841-68b8a16b5387","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[336,24],"id":"e26082e5-86c1-4391-864a-c1dc03b21955","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[-1256,384],"id":"f6e42255-5dd9-445a-a44c-88744688e13f","name":"4o","credentials":{"openRouterApi":{"id":"Lwm7OCNgUYON0Xsb","name":"OpenRouter account"}}},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[-336,160],"id":"3d42e1e9-73a3-4b2a-ad35-c471f4aec6fa","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[560,-168],"id":"2b44fd19-f705-46ea-93d1-0512d3443687","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[784,-168],"id":"d661c689-66d0-44ab-929b-584bd552e17f","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1008,-168],"id":"10a89e73-1546-422b-8f9f-8412ddb6aefa","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[-1712,64],"id":"05dbe6e4-1a38-469f-b3c5-5a1737430c92","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[-1712,-704],"id":"6c69d852-58f8-438d-a9d7-e86655954825","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-1792,-832],"id":"6ecca7da-ac54-4a95-bf4d-7d1a3365194f","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-1840,-152],"id":"172948a1-7036-4239-a4ae-1fdf43772baa","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-436,-360],"id":"a9eb29e7-e30b-4025-87ba-60a0a61742c0","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[210,-288],"id":"807c9c65-1a7d-4d54-8284-c1d89f876f7e","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[34,4],"id":"0b0cee35-9758-410b-8e5e-c00961544aba","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[34,236],"id":"b3c3ef7b-c024-42c8-a42f-4ed7e40e823d","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-1784,-936],"id":"c37858b1-297a-4898-8b9d-84dfc6d0b99c","name":"Sticky Note6"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"AI Agent":{"main":[[{"node":"Split Out","type":"main","index":0}]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Add to Sheet","type":"main","index":0}]]},"Add to Sheet":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	2026-05-05 05:13:25.977+00	2026-05-05 05:35:22.276+00	{"executionOrder":"v1","binaryMode":"separate"}	\N	{}	d3a4bdc3-a84c-48c8-be1f-48b81867e620	0	7JoImKafB7kqtzgS	{"templateCredsSetupCompleted":true}	\N	f	22	\N	\N
\.


--
-- Data for Name: ai_builder_temporary_workflow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."ai_builder_temporary_workflow" ("workflowId", "threadId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: annotation_tag_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."annotation_tag_entity" ("id", "name", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."auth_identity" ("userId", "providerId", "providerType", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_provider_sync_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."auth_provider_sync_history" ("id", "providerType", "runMode", "status", "startedAt", "endedAt", "scanned", "created", "updated", "disabled", "error") FROM stdin;
\.


--
-- Data for Name: binary_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."binary_data" ("fileId", "sourceType", "sourceId", "data", "mimeType", "fileName", "fileSize", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: dynamic_credential_resolver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."dynamic_credential_resolver" ("id", "name", "type", "config", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: credentials_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."credentials_entity" ("name", "data", "type", "createdAt", "updatedAt", "id", "isManaged", "isGlobal", "isResolvable", "resolvableAllowFallback", "resolverId") FROM stdin;
OpenRouter account	U2FsdGVkX18IIgYO5p+l8cspaqzHGQZkpfpSnrSkPTf0gJCzsvB8/+P3P+w8HO4KAQ0QN1oF644zdlG1qwJZ6fQy89PIwPPdlCTOjF17Sp0z0bba+B+5eIYxx+ySz4LN/1sOoggdkNE+mDcJHIITeA==	openRouterApi	2026-05-05 05:23:35.608+00	2026-05-05 05:23:35.606+00	Lwm7OCNgUYON0Xsb	f	f	f	f	\N
Google Sheets account	U2FsdGVkX19YW7gLK4kUhOGJioF15LLjPGVAv4HK0Q7ZdTLjOZsX/obPQI46xLWxYy71clQ8zc8O44x7fVnWv5JJFecG1LDxOjiq65KRJk1vFhQ9QXXqLke+J/l8eoQoCDGmgwn3EuAkjJMO8eAmRl2f7SZdfhD1Vffzijqz4du5J25hoBGt1dbyGrvx2wQ1ANHr8oK8ApkSGoooJfH6Zu7yZl/c2K5M+gzSWcXD1Uxiy9vs2hR05xU8G2g2qm8adiELJlxwYkLHb7EWLj92uA==	googleSheetsOAuth2Api	2026-05-05 05:29:01.802+00	2026-05-05 05:33:20.994+00	8p8BWUhmTZxFMNhj	f	f	f	f	\N
\.


--
-- Data for Name: chat_hub_agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_hub_agents" ("id", "name", "description", "systemPrompt", "ownerId", "credentialId", "provider", "model", "createdAt", "updatedAt", "icon", "files", "suggestedPrompts") FROM stdin;
\.


--
-- Data for Name: chat_hub_tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_hub_tools" ("id", "name", "type", "typeVersion", "ownerId", "definition", "enabled", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: chat_hub_agent_tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_hub_agent_tools" ("agentId", "toolId") FROM stdin;
\.


--
-- Data for Name: chat_hub_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_hub_sessions" ("id", "title", "ownerId", "lastMessageAt", "credentialId", "provider", "model", "workflowId", "createdAt", "updatedAt", "agentId", "agentName", "type") FROM stdin;
\.


--
-- Data for Name: execution_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."execution_entity" ("id", "finished", "mode", "retryOf", "retrySuccessId", "startedAt", "stoppedAt", "waitTill", "status", "workflowId", "deletedAt", "createdAt", "storedAt") FROM stdin;
\.


--
-- Data for Name: chat_hub_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_hub_messages" ("id", "sessionId", "previousMessageId", "revisionOfMessageId", "retryOfMessageId", "type", "name", "content", "provider", "model", "workflowId", "executionId", "createdAt", "updatedAt", "agentId", "status", "attachments") FROM stdin;
\.


--
-- Data for Name: chat_hub_session_tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."chat_hub_session_tools" ("sessionId", "toolId") FROM stdin;
\.


--
-- Data for Name: credential_dependency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."credential_dependency" ("id", "credentialId", "dependencyType", "dependencyId", "createdAt") FROM stdin;
\.


--
-- Data for Name: data_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."data_table" ("id", "name", "projectId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: data_table_column; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."data_table_column" ("id", "name", "type", "index", "dataTableId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: deployment_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."deployment_key" ("id", "type", "value", "algorithm", "status", "createdAt", "updatedAt") FROM stdin;
wBpcDpvJ5MUp82IM	instance.id	7d4960826251eed6bd0803e7c2bcf9baa1a63356503baef5c5428a48b82b3649	\N	active	2026-05-01 00:31:07.872+00	2026-05-01 00:31:07.872+00
nnz9NoZUkLk7g3qE	signing.hmac	b6e33b29954dde68e90c1dd89bccc74dd85f98fd58883d31c43eeec0510d8427	\N	active	2026-05-01 00:31:09.394+00	2026-05-01 00:31:09.394+00
eeCSd7q8JzgMloGl	signing.jwt	e016bb4e4f0a15b4050b7ffd1df30f6023c11ac4c979fbc19d9cec8da962ca04	\N	active	2026-05-01 00:31:10.87+00	2026-05-01 00:31:10.87+00
clAdcvcKbk2klNyy	signing.binary_data	Se8F1kM13o1winm4eogaVm37HAUNPbIe+12LJ0dB+FA=	\N	active	2026-05-01 00:31:12.211+00	2026-05-01 00:31:12.211+00
\.


--
-- Data for Name: dynamic_credential_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."dynamic_credential_entry" ("credential_id", "subject_id", "resolver_id", "data", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: dynamic_credential_user_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."dynamic_credential_user_entry" ("credentialId", "userId", "resolverId", "data", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: event_destinations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."event_destinations" ("id", "destination", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: execution_annotations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."execution_annotations" ("id", "executionId", "vote", "note", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: execution_annotation_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."execution_annotation_tags" ("annotationId", "tagId") FROM stdin;
\.


--
-- Data for Name: execution_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."execution_data" ("executionId", "workflowData", "data", "workflowVersionId") FROM stdin;
\.


--
-- Data for Name: execution_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."execution_metadata" ("id", "executionId", "key", "value") FROM stdin;
\.


--
-- Data for Name: tag_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."tag_entity" ("name", "createdAt", "updatedAt", "id") FROM stdin;
\.


--
-- Data for Name: folder_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."folder_tag" ("folderId", "tagId") FROM stdin;
\.


--
-- Data for Name: insights_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."insights_metadata" ("metaId", "workflowId", "projectId", "workflowName", "projectName") FROM stdin;
\.


--
-- Data for Name: insights_by_period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."insights_by_period" ("id", "metaId", "type", "value", "periodUnit", "periodStart") FROM stdin;
\.


--
-- Data for Name: insights_raw; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."insights_raw" ("id", "metaId", "type", "value", "timestamp") FROM stdin;
\.


--
-- Data for Name: installed_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."installed_packages" ("packageName", "installedVersion", "authorName", "authorEmail", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: installed_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."installed_nodes" ("name", "type", "latestVersion", "package") FROM stdin;
\.


--
-- Data for Name: instance_ai_iteration_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_iteration_logs" ("id", "threadId", "taskKey", "entry", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_ai_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_messages" ("id", "threadId", "content", "role", "type", "resourceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_ai_observational_memory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_observational_memory" ("id", "lookupKey", "scope", "threadId", "resourceId", "activeObservations", "originType", "config", "generationCount", "lastObservedAt", "pendingMessageTokens", "totalTokensObserved", "observationTokenCount", "isObserving", "isReflecting", "observedMessageIds", "observedTimezone", "bufferedObservations", "bufferedObservationTokens", "bufferedMessageIds", "bufferedReflection", "bufferedReflectionTokens", "bufferedReflectionInputTokens", "reflectedObservationLineCount", "bufferedObservationChunks", "isBufferingObservation", "isBufferingReflection", "lastBufferedAtTokens", "lastBufferedAtTime", "metadata", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_ai_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_resources" ("id", "workingMemory", "metadata", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_ai_run_snapshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_run_snapshots" ("threadId", "runId", "messageGroupId", "runIds", "tree", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_ai_workflow_snapshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_ai_workflow_snapshots" ("runId", "workflowName", "resourceId", "status", "snapshot", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: instance_version_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."instance_version_history" ("id", "major", "minor", "patch", "createdAt") FROM stdin;
1	2	18	5	2026-05-01 00:33:23.812+00
\.


--
-- Data for Name: invalid_auth_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."invalid_auth_token" ("token", "expiresAt") FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."migrations" ("id", "timestamp", "name") FROM stdin;
1	1587669153312	InitialMigration1587669153312
2	1589476000887	WebhookModel1589476000887
3	1594828256133	CreateIndexStoppedAt1594828256133
4	1607431743768	MakeStoppedAtNullable1607431743768
5	1611144599516	AddWebhookId1611144599516
6	1617270242566	CreateTagEntity1617270242566
7	1620824779533	UniqueWorkflowNames1620824779533
8	1626176912946	AddwaitTill1626176912946
9	1630419189837	UpdateWorkflowCredentials1630419189837
10	1644422880309	AddExecutionEntityIndexes1644422880309
11	1646834195327	IncreaseTypeVarcharLimit1646834195327
12	1646992772331	CreateUserManagement1646992772331
13	1648740597343	LowerCaseUserEmail1648740597343
14	1652254514002	CommunityNodes1652254514002
15	1652367743993	AddUserSettings1652367743993
16	1652905585850	AddAPIKeyColumn1652905585850
17	1654090467022	IntroducePinData1654090467022
18	1658932090381	AddNodeIds1658932090381
19	1659902242948	AddJsonKeyPinData1659902242948
20	1660062385367	CreateCredentialsUserRole1660062385367
21	1663755770893	CreateWorkflowsEditorRole1663755770893
22	1664196174001	WorkflowStatistics1664196174001
23	1665484192212	CreateCredentialUsageTable1665484192212
24	1665754637025	RemoveCredentialUsageTable1665754637025
25	1669739707126	AddWorkflowVersionIdColumn1669739707126
26	1669823906995	AddTriggerCountColumn1669823906995
27	1671535397530	MessageEventBusDestinations1671535397530
28	1671726148421	RemoveWorkflowDataLoadedFlag1671726148421
29	1673268682475	DeleteExecutionsWithWorkflows1673268682475
30	1674138566000	AddStatusToExecutions1674138566000
31	1674509946020	CreateLdapEntities1674509946020
32	1675940580449	PurgeInvalidWorkflowConnections1675940580449
33	1676996103000	MigrateExecutionStatus1676996103000
34	1677236854063	UpdateRunningExecutionStatus1677236854063
35	1677501636754	CreateVariables1677501636754
36	1679416281778	CreateExecutionMetadataTable1679416281778
37	1681134145996	AddUserActivatedProperty1681134145996
38	1681134145997	RemoveSkipOwnerSetup1681134145997
39	1690000000000	MigrateIntegerKeysToString1690000000000
40	1690000000020	SeparateExecutionData1690000000020
41	1690000000030	RemoveResetPasswordColumns1690000000030
42	1690000000030	AddMfaColumns1690000000030
43	1690787606731	AddMissingPrimaryKeyOnExecutionData1690787606731
44	1691088862123	CreateWorkflowNameIndex1691088862123
45	1692967111175	CreateWorkflowHistoryTable1692967111175
46	1693491613982	ExecutionSoftDelete1693491613982
47	1693554410387	DisallowOrphanExecutions1693554410387
48	1694091729095	MigrateToTimestampTz1694091729095
49	1695128658538	AddWorkflowMetadata1695128658538
50	1695829275184	ModifyWorkflowHistoryNodesAndConnections1695829275184
51	1700571993961	AddGlobalAdminRole1700571993961
52	1705429061930	DropRoleMapping1705429061930
53	1711018413374	RemoveFailedExecutionStatus1711018413374
54	1711390882123	MoveSshKeysToDatabase1711390882123
55	1712044305787	RemoveNodesAccess1712044305787
56	1714133768519	CreateProject1714133768519
57	1714133768521	MakeExecutionStatusNonNullable1714133768521
58	1717498465931	AddActivatedAtUserSetting1717498465931
59	1720101653148	AddConstraintToExecutionMetadata1720101653148
60	1721377157740	FixExecutionMetadataSequence1721377157740
61	1723627610222	CreateInvalidAuthTokenTable1723627610222
62	1723796243146	RefactorExecutionIndices1723796243146
63	1724753530828	CreateAnnotationTables1724753530828
64	1724951148974	AddApiKeysTable1724951148974
65	1726606152711	CreateProcessedDataTable1726606152711
66	1727427440136	SeparateExecutionCreationFromStart1727427440136
67	1728659839644	AddMissingPrimaryKeyOnAnnotationTagMapping1728659839644
68	1729607673464	UpdateProcessedDataValueColumnToText1729607673464
69	1729607673469	AddProjectIcons1729607673469
70	1730386903556	CreateTestDefinitionTable1730386903556
71	1731404028106	AddDescriptionToTestDefinition1731404028106
72	1731582748663	MigrateTestDefinitionKeyToString1731582748663
73	1732271325258	CreateTestMetricTable1732271325258
74	1732549866705	CreateTestRun1732549866705
75	1733133775640	AddMockedNodesColumnToTestDefinition1733133775640
76	1734479635324	AddManagedColumnToCredentialsTable1734479635324
77	1736172058779	AddStatsColumnsToTestRun1736172058779
78	1736947513045	CreateTestCaseExecutionTable1736947513045
79	1737715421462	AddErrorColumnsToTestRuns1737715421462
80	1738709609940	CreateFolderTable1738709609940
81	1739549398681	CreateAnalyticsTables1739549398681
82	1740445074052	UpdateParentFolderIdColumn1740445074052
83	1741167584277	RenameAnalyticsToInsights1741167584277
84	1742918400000	AddScopesColumnToApiKeys1742918400000
85	1745322634000	ClearEvaluation1745322634000
86	1745587087521	AddWorkflowStatisticsRootCount1745587087521
87	1745934666076	AddWorkflowArchivedColumn1745934666076
88	1745934666077	DropRoleTable1745934666077
89	1747824239000	AddProjectDescriptionColumn1747824239000
90	1750252139166	AddLastActiveAtColumnToUser1750252139166
91	1750252139166	AddScopeTables1750252139166
92	1750252139167	AddRolesTables1750252139167
93	1750252139168	LinkRoleToUserTable1750252139168
94	1750252139170	RemoveOldRoleColumn1750252139170
95	1752669793000	AddInputsOutputsToTestCaseExecution1752669793000
96	1753953244168	LinkRoleToProjectRelationTable1753953244168
97	1754475614601	CreateDataStoreTables1754475614601
98	1754475614602	ReplaceDataStoreTablesWithDataTables1754475614602
99	1756906557570	AddTimestampsToRoleAndRoleIndexes1756906557570
100	1758731786132	AddAudienceColumnToApiKeys1758731786132
101	1758794506893	AddProjectIdToVariableTable1758794506893
102	1759399811000	ChangeValueTypesForInsights1759399811000
103	1760019379982	CreateChatHubTables1760019379982
104	1760020000000	CreateChatHubAgentTable1760020000000
105	1760020838000	UniqueRoleNames1760020838000
106	1760116750277	CreateOAuthEntities1760116750277
107	1760314000000	CreateWorkflowDependencyTable1760314000000
108	1760314000000	CreateWorkflowDependencyTable1760314000000
109	1760965142113	DropUnusedChatHubColumns1760965142113
110	1761047826451	AddWorkflowVersionColumn1761047826451
111	1761655473000	ChangeDependencyInfoToJson1761655473000
112	1761773155024	AddAttachmentsToChatHubMessages1761773155024
113	1761830340990	AddToolsColumnToChatHubTables1761830340990
114	1762177736257	AddWorkflowDescriptionColumn1762177736257
115	1762763704614	BackfillMissingWorkflowHistoryRecords1762763704614
116	1762771264000	ChangeDefaultForIdInUserTable1762771264000
117	1762771954619	AddIsGlobalColumnToCredentialsTable1762771954619
118	1762847206508	AddWorkflowHistoryAutoSaveFields1762847206508
119	1763047800000	AddActiveVersionIdColumn1763047800000
120	1763048000000	ActivateExecuteWorkflowTriggerWorkflows1763048000000
121	1763572724000	ChangeOAuthStateColumnToUnboundedVarchar1763572724000
122	1763716655000	CreateBinaryDataTable1763716655000
123	1764167920585	CreateWorkflowPublishHistoryTable1764167920585
124	1764276827837	AddCreatorIdToProjectTable1764276827837
125	1764682447000	CreateDynamicCredentialResolverTable1764682447000
126	1764689388394	AddDynamicCredentialEntryTable1764689388394
127	1765448186933	BackfillMissingWorkflowHistoryRecords1765448186933
128	1765459448000	AddResolvableFieldsToCredentials1765459448000
129	1765788427674	AddIconToAgentTable1765788427674
130	1765804780000	ConvertAgentIdToUuid1765804780000
131	1765886667897	AddAgentIdForeignKeys1765886667897
132	1765892199653	AddWorkflowVersionIdToExecutionData1765892199653
133	1766064542000	AddWorkflowPublishScopeToProjectRoles1766064542000
134	1766068346315	AddChatMessageIndices1766068346315
135	1766500000000	ExpandInsightsWorkflowIdLength1766500000000
136	1767018516000	ChangeWorkflowStatisticsFKToNoAction1767018516000
137	1768402473068	ExpandModelColumnLength1768402473068
138	1768557000000	AddStoredAtToExecutionEntity1768557000000
139	1768901721000	AddDynamicCredentialUserEntryTable1768901721000
140	1769000000000	AddPublishedVersionIdToWorkflowDependency1769000000000
141	1769433700000	CreateSecretsProviderConnectionTables1769433700000
142	1769698710000	CreateWorkflowPublishedVersionTable1769698710000
143	1769784356000	ExpandSubjectIDColumnLength1769784356000
144	1769900001000	AddWorkflowUnpublishScopeToCustomRoles1769900001000
145	1770000000000	CreateChatHubToolsTable1770000000000
146	1770000000000	ExpandProviderIdColumnLength1770000000000
147	1770220686000	CreateWorkflowBuilderSessionTable1770220686000
148	1771417407753	AddScalingFieldsToTestRun1771417407753
149	1771500000000	MigrateExternalSecretsToEntityStorage1771500000000
150	1771500000001	AddUnshareScopeToCustomRoles1771500000001
151	1771500000002	AddFilesColumnToChatHubAgents1771500000002
152	1772000000000	AddSuggestedPromptsToAgentTable1772000000000
153	1772619247761	AddRoleColumnToProjectSecretsProviderAccess1772619247761
154	1772619247762	ChangeWorkflowPublishedVersionFKsToRestrict1772619247762
155	1772700000000	AddTypeToChatHubSessions1772700000000
156	1772800000000	CreateRoleMappingRuleTable1772800000000
157	1773000000000	CreateCredentialDependencyTable1773000000000
158	1774280963551	AddRestoreFieldsToWorkflowBuilderSession1774280963551
159	1774854660000	CreateInstanceVersionHistoryTable1774854660000
160	1775000000000	CreateInstanceAiTables1775000000000
161	1775116241000	CreateTokenExchangeJtiTable1775116241000
162	1775740765000	ChangeWorkflowPublishHistoryVersionIdToSetNull1775740765000
163	1776000000000	CreateTrustedKeyTables1776000000000
164	1776150756000	CreateFavoritesTable1776150756000
165	1777000000000	CreateDeploymentKeyTable1777000000000
166	1777281990043	CreateAiBuilderTemporaryWorkflowTable1777281990043
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."oauth_clients" ("id", "name", "redirectUris", "grantTypes", "clientSecret", "clientSecretExpiresAt", "tokenEndpointAuthMethod", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."oauth_access_tokens" ("token", "clientId", "userId") FROM stdin;
\.


--
-- Data for Name: oauth_authorization_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."oauth_authorization_codes" ("code", "clientId", "userId", "redirectUri", "codeChallenge", "codeChallengeMethod", "expiresAt", "state", "used", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."oauth_refresh_tokens" ("token", "clientId", "userId", "expiresAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: oauth_user_consents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."oauth_user_consents" ("id", "userId", "clientId", "grantedAt") FROM stdin;
\.


--
-- Data for Name: processed_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."processed_data" ("workflowId", "context", "createdAt", "updatedAt", "value") FROM stdin;
\.


--
-- Data for Name: project_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."project_relation" ("projectId", "userId", "role", "createdAt", "updatedAt") FROM stdin;
O0pFdMJSB9FZDT1n	fea4af2e-1af7-42db-96f1-90c44eacc092	project:personalOwner	2026-05-01 00:23:04.692+00	2026-05-01 00:23:04.692+00
\.


--
-- Data for Name: secrets_provider_connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."secrets_provider_connection" ("id", "providerKey", "type", "encryptedSettings", "isEnabled", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: project_secrets_provider_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."project_secrets_provider_access" ("secretsProviderConnectionId", "projectId", "createdAt", "updatedAt", "role") FROM stdin;
\.


--
-- Data for Name: role_mapping_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."role_mapping_rule" ("id", "expression", "role", "type", "order", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: role_mapping_rule_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."role_mapping_rule_project" ("roleMappingRuleId", "projectId") FROM stdin;
\.


--
-- Data for Name: scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."scope" ("slug", "displayName", "description") FROM stdin;
workflow:unpublish	Unpublish Workflow	Allows unpublishing workflows.
workflow:unshare	Unshare Workflow	Allows removing workflow shares.
credential:unshare	Unshare Credential	Allows removing credential shares.
aiAssistant:manage	Manage AI Usage	Allows managing AI Usage settings.
aiAssistant:*	aiAssistant:*	\N
annotationTag:create	Create Annotation Tag	Allows creating new annotation tags.
annotationTag:read	annotationTag:read	\N
annotationTag:update	annotationTag:update	\N
annotationTag:delete	annotationTag:delete	\N
annotationTag:list	annotationTag:list	\N
annotationTag:*	annotationTag:*	\N
auditLogs:manage	auditLogs:manage	\N
auditLogs:*	auditLogs:*	\N
banner:dismiss	banner:dismiss	\N
banner:*	banner:*	\N
community:register	community:register	\N
community:*	community:*	\N
communityPackage:install	communityPackage:install	\N
communityPackage:uninstall	communityPackage:uninstall	\N
communityPackage:update	communityPackage:update	\N
communityPackage:list	communityPackage:list	\N
communityPackage:manage	communityPackage:manage	\N
communityPackage:*	communityPackage:*	\N
credential:share	credential:share	\N
credential:shareGlobally	credential:shareGlobally	\N
credential:move	credential:move	\N
credential:create	credential:create	\N
credential:read	credential:read	\N
credential:update	credential:update	\N
credential:delete	credential:delete	\N
credential:list	credential:list	\N
credential:*	credential:*	\N
externalSecretsProvider:sync	externalSecretsProvider:sync	\N
externalSecretsProvider:create	externalSecretsProvider:create	\N
externalSecretsProvider:read	externalSecretsProvider:read	\N
externalSecretsProvider:update	externalSecretsProvider:update	\N
externalSecretsProvider:delete	externalSecretsProvider:delete	\N
externalSecretsProvider:list	externalSecretsProvider:list	\N
externalSecretsProvider:*	externalSecretsProvider:*	\N
externalSecret:list	externalSecret:list	\N
externalSecret:*	externalSecret:*	\N
eventBusDestination:test	eventBusDestination:test	\N
eventBusDestination:create	eventBusDestination:create	\N
eventBusDestination:read	eventBusDestination:read	\N
eventBusDestination:update	eventBusDestination:update	\N
eventBusDestination:delete	eventBusDestination:delete	\N
eventBusDestination:list	eventBusDestination:list	\N
eventBusDestination:*	eventBusDestination:*	\N
ldap:sync	ldap:sync	\N
ldap:manage	ldap:manage	\N
ldap:*	ldap:*	\N
license:manage	license:manage	\N
license:*	license:*	\N
logStreaming:manage	logStreaming:manage	\N
logStreaming:*	logStreaming:*	\N
orchestration:read	orchestration:read	\N
orchestration:list	orchestration:list	\N
orchestration:*	orchestration:*	\N
project:create	project:create	\N
project:read	project:read	\N
project:update	project:update	\N
project:delete	project:delete	\N
project:list	project:list	\N
project:*	project:*	\N
saml:manage	saml:manage	\N
saml:*	saml:*	\N
securityAudit:generate	securityAudit:generate	\N
securityAudit:*	securityAudit:*	\N
securitySettings:manage	securitySettings:manage	\N
securitySettings:*	securitySettings:*	\N
sourceControl:pull	sourceControl:pull	\N
sourceControl:push	sourceControl:push	\N
sourceControl:manage	sourceControl:manage	\N
sourceControl:*	sourceControl:*	\N
tag:create	tag:create	\N
tag:read	tag:read	\N
tag:update	tag:update	\N
tag:delete	tag:delete	\N
tag:list	tag:list	\N
tag:*	tag:*	\N
user:resetPassword	user:resetPassword	\N
user:changeRole	user:changeRole	\N
user:enforceMfa	user:enforceMfa	\N
user:generateInviteLink	user:generateInviteLink	\N
user:create	user:create	\N
user:read	user:read	\N
user:update	user:update	\N
user:delete	user:delete	\N
user:list	user:list	\N
user:*	user:*	\N
variable:create	variable:create	\N
variable:read	variable:read	\N
variable:update	variable:update	\N
variable:delete	variable:delete	\N
variable:list	variable:list	\N
variable:*	variable:*	\N
projectVariable:create	projectVariable:create	\N
projectVariable:read	projectVariable:read	\N
projectVariable:update	projectVariable:update	\N
projectVariable:delete	projectVariable:delete	\N
projectVariable:list	projectVariable:list	\N
projectVariable:*	projectVariable:*	\N
workersView:manage	workersView:manage	\N
workersView:*	workersView:*	\N
workflow:share	workflow:share	\N
workflow:execute	workflow:execute	\N
workflow:execute-chat	workflow:execute-chat	\N
workflow:move	workflow:move	\N
workflow:activate	workflow:activate	\N
workflow:deactivate	workflow:deactivate	\N
workflow:updateRedactionSetting	workflow:updateRedactionSetting	\N
workflow:create	workflow:create	\N
workflow:read	workflow:read	\N
workflow:update	workflow:update	\N
workflow:delete	workflow:delete	\N
workflow:list	workflow:list	\N
workflow:*	workflow:*	\N
folder:create	folder:create	\N
folder:read	folder:read	\N
folder:update	folder:update	\N
folder:delete	folder:delete	\N
folder:list	folder:list	\N
folder:move	folder:move	\N
folder:*	folder:*	\N
insights:list	insights:list	\N
insights:read	Read Insights	Allows reading insights data.
insights:*	insights:*	\N
oidc:manage	oidc:manage	\N
oidc:*	oidc:*	\N
provisioning:manage	provisioning:manage	\N
provisioning:*	provisioning:*	\N
dataTable:create	dataTable:create	\N
dataTable:read	dataTable:read	\N
dataTable:update	dataTable:update	\N
dataTable:delete	dataTable:delete	\N
dataTable:list	dataTable:list	\N
dataTable:readRow	dataTable:readRow	\N
dataTable:writeRow	dataTable:writeRow	\N
dataTable:listProject	dataTable:listProject	\N
dataTable:*	dataTable:*	\N
execution:delete	execution:delete	\N
execution:read	execution:read	\N
execution:retry	execution:retry	\N
execution:list	execution:list	\N
execution:get	execution:get	\N
execution:reveal	execution:reveal	\N
execution:*	execution:*	\N
workflowTags:update	workflowTags:update	\N
workflowTags:list	workflowTags:list	\N
workflowTags:*	workflowTags:*	\N
role:manage	role:manage	\N
role:*	role:*	\N
mcp:manage	mcp:manage	\N
mcp:oauth	mcp:oauth	\N
mcp:*	mcp:*	\N
mcpApiKey:create	mcpApiKey:create	\N
mcpApiKey:rotate	mcpApiKey:rotate	\N
mcpApiKey:*	mcpApiKey:*	\N
chatHub:manage	chatHub:manage	\N
chatHub:message	chatHub:message	\N
chatHub:*	chatHub:*	\N
chatHubAgent:create	chatHubAgent:create	\N
chatHubAgent:read	chatHubAgent:read	\N
chatHubAgent:update	chatHubAgent:update	\N
chatHubAgent:delete	chatHubAgent:delete	\N
chatHubAgent:list	chatHubAgent:list	\N
chatHubAgent:*	chatHubAgent:*	\N
breakingChanges:list	breakingChanges:list	\N
breakingChanges:*	breakingChanges:*	\N
apiKey:manage	apiKey:manage	\N
apiKey:*	apiKey:*	\N
credentialResolver:create	credentialResolver:create	\N
credentialResolver:read	credentialResolver:read	\N
credentialResolver:update	credentialResolver:update	\N
credentialResolver:delete	credentialResolver:delete	\N
credentialResolver:list	credentialResolver:list	\N
credentialResolver:*	credentialResolver:*	\N
instanceAi:message	instanceAi:message	\N
instanceAi:manage	instanceAi:manage	\N
instanceAi:gateway	instanceAi:gateway	\N
instanceAi:*	instanceAi:*	\N
roleMappingRule:create	roleMappingRule:create	\N
roleMappingRule:read	roleMappingRule:read	\N
roleMappingRule:update	roleMappingRule:update	\N
roleMappingRule:delete	roleMappingRule:delete	\N
roleMappingRule:list	roleMappingRule:list	\N
roleMappingRule:*	roleMappingRule:*	\N
*	*	\N
workflow:publish	Publish Workflow	Allows publishing workflows.
\.


--
-- Data for Name: role_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."role_scope" ("roleSlug", "scopeSlug") FROM stdin;
global:owner	workflow:unpublish
global:owner	workflow:unshare
global:owner	credential:unshare
global:owner	aiAssistant:manage
global:owner	annotationTag:create
global:owner	annotationTag:read
global:owner	annotationTag:update
global:owner	annotationTag:delete
global:owner	annotationTag:list
global:owner	auditLogs:manage
global:owner	banner:dismiss
global:owner	community:register
global:owner	communityPackage:install
global:owner	communityPackage:uninstall
global:owner	communityPackage:update
global:owner	communityPackage:list
global:owner	credential:share
global:owner	credential:shareGlobally
global:owner	credential:move
global:owner	credential:create
global:owner	credential:read
global:owner	credential:update
global:owner	credential:delete
global:owner	credential:list
global:owner	externalSecretsProvider:sync
global:owner	externalSecretsProvider:create
global:owner	externalSecretsProvider:read
global:owner	externalSecretsProvider:update
global:owner	externalSecretsProvider:delete
global:owner	externalSecretsProvider:list
global:owner	externalSecret:list
global:owner	eventBusDestination:test
global:owner	eventBusDestination:create
global:owner	eventBusDestination:read
global:owner	eventBusDestination:update
global:owner	eventBusDestination:delete
global:owner	eventBusDestination:list
global:owner	ldap:sync
global:owner	ldap:manage
global:owner	license:manage
global:owner	logStreaming:manage
global:owner	orchestration:read
global:owner	project:create
global:owner	project:read
global:owner	project:update
global:owner	project:delete
global:owner	project:list
global:owner	saml:manage
global:owner	securityAudit:generate
global:owner	securitySettings:manage
global:owner	sourceControl:pull
global:owner	sourceControl:push
global:owner	sourceControl:manage
global:owner	tag:create
global:owner	tag:read
global:owner	tag:update
global:owner	tag:delete
global:owner	tag:list
global:owner	user:resetPassword
global:owner	user:changeRole
global:owner	user:enforceMfa
global:owner	user:generateInviteLink
global:owner	user:create
global:owner	user:read
global:owner	user:update
global:owner	user:delete
global:owner	user:list
global:owner	variable:create
global:owner	variable:read
global:owner	variable:update
global:owner	variable:delete
global:owner	variable:list
global:owner	projectVariable:create
global:owner	projectVariable:read
global:owner	projectVariable:update
global:owner	projectVariable:delete
global:owner	projectVariable:list
global:owner	workersView:manage
global:owner	workflow:share
global:owner	workflow:execute
global:owner	workflow:execute-chat
global:owner	workflow:move
global:owner	workflow:updateRedactionSetting
global:owner	workflow:create
global:owner	workflow:read
global:owner	workflow:update
global:owner	workflow:delete
global:owner	workflow:list
global:owner	folder:create
global:owner	folder:read
global:owner	folder:update
global:owner	folder:delete
global:owner	folder:list
global:owner	folder:move
global:owner	insights:list
global:owner	insights:read
global:owner	oidc:manage
global:owner	provisioning:manage
global:owner	dataTable:create
global:owner	dataTable:read
global:owner	dataTable:update
global:owner	dataTable:delete
global:owner	dataTable:list
global:owner	dataTable:readRow
global:owner	dataTable:writeRow
global:owner	dataTable:listProject
global:owner	execution:reveal
global:owner	role:manage
global:owner	mcp:manage
global:owner	mcp:oauth
global:owner	mcpApiKey:create
global:owner	mcpApiKey:rotate
global:owner	chatHub:manage
global:owner	chatHub:message
global:owner	chatHubAgent:create
global:owner	chatHubAgent:read
global:owner	chatHubAgent:update
global:owner	chatHubAgent:delete
global:owner	chatHubAgent:list
global:owner	breakingChanges:list
global:owner	apiKey:manage
global:owner	credentialResolver:create
global:owner	credentialResolver:read
global:owner	credentialResolver:update
global:owner	credentialResolver:delete
global:owner	credentialResolver:list
global:owner	instanceAi:message
global:owner	instanceAi:manage
global:owner	instanceAi:gateway
global:owner	roleMappingRule:create
global:owner	roleMappingRule:read
global:owner	roleMappingRule:update
global:owner	roleMappingRule:delete
global:owner	roleMappingRule:list
global:owner	workflow:publish
global:admin	workflow:unpublish
global:admin	workflow:unshare
global:admin	credential:unshare
global:admin	aiAssistant:manage
global:admin	annotationTag:create
global:admin	annotationTag:read
global:admin	annotationTag:update
global:admin	annotationTag:delete
global:admin	annotationTag:list
global:admin	auditLogs:manage
global:admin	banner:dismiss
global:admin	community:register
global:admin	communityPackage:install
global:admin	communityPackage:uninstall
global:admin	communityPackage:update
global:admin	communityPackage:list
global:admin	credential:share
global:admin	credential:shareGlobally
global:admin	credential:move
global:admin	credential:create
global:admin	credential:read
global:admin	credential:update
global:admin	credential:delete
global:admin	credential:list
global:admin	externalSecretsProvider:sync
global:admin	externalSecretsProvider:create
global:admin	externalSecretsProvider:read
global:admin	externalSecretsProvider:update
global:admin	externalSecretsProvider:delete
global:admin	externalSecretsProvider:list
global:admin	externalSecret:list
global:admin	eventBusDestination:test
global:admin	eventBusDestination:create
global:admin	eventBusDestination:read
global:admin	eventBusDestination:update
global:admin	eventBusDestination:delete
global:admin	eventBusDestination:list
global:admin	ldap:sync
global:admin	ldap:manage
global:admin	license:manage
global:admin	logStreaming:manage
global:admin	orchestration:read
global:admin	project:create
global:admin	project:read
global:admin	project:update
global:admin	project:delete
global:admin	project:list
global:admin	saml:manage
global:admin	securityAudit:generate
global:admin	securitySettings:manage
global:admin	sourceControl:pull
global:admin	sourceControl:push
global:admin	sourceControl:manage
global:admin	tag:create
global:admin	tag:read
global:admin	tag:update
global:admin	tag:delete
global:admin	tag:list
global:admin	user:resetPassword
global:admin	user:changeRole
global:admin	user:enforceMfa
global:admin	user:generateInviteLink
global:admin	user:create
global:admin	user:read
global:admin	user:update
global:admin	user:delete
global:admin	user:list
global:admin	variable:create
global:admin	variable:read
global:admin	variable:update
global:admin	variable:delete
global:admin	variable:list
global:admin	projectVariable:create
global:admin	projectVariable:read
global:admin	projectVariable:update
global:admin	projectVariable:delete
global:admin	projectVariable:list
global:admin	workersView:manage
global:admin	workflow:share
global:admin	workflow:execute
global:admin	workflow:execute-chat
global:admin	workflow:move
global:admin	workflow:updateRedactionSetting
global:admin	workflow:create
global:admin	workflow:read
global:admin	workflow:update
global:admin	workflow:delete
global:admin	workflow:list
global:admin	folder:create
global:admin	folder:read
global:admin	folder:update
global:admin	folder:delete
global:admin	folder:list
global:admin	folder:move
global:admin	insights:list
global:admin	insights:read
global:admin	oidc:manage
global:admin	provisioning:manage
global:admin	dataTable:create
global:admin	dataTable:read
global:admin	dataTable:update
global:admin	dataTable:delete
global:admin	dataTable:list
global:admin	dataTable:readRow
global:admin	dataTable:writeRow
global:admin	dataTable:listProject
global:admin	execution:reveal
global:admin	role:manage
global:admin	mcp:manage
global:admin	mcp:oauth
global:admin	mcpApiKey:create
global:admin	mcpApiKey:rotate
global:admin	chatHub:manage
global:admin	chatHub:message
global:admin	chatHubAgent:create
global:admin	chatHubAgent:read
global:admin	chatHubAgent:update
global:admin	chatHubAgent:delete
global:admin	chatHubAgent:list
global:admin	breakingChanges:list
global:admin	apiKey:manage
global:admin	credentialResolver:create
global:admin	credentialResolver:read
global:admin	credentialResolver:update
global:admin	credentialResolver:delete
global:admin	credentialResolver:list
global:admin	instanceAi:message
global:admin	instanceAi:manage
global:admin	instanceAi:gateway
global:admin	roleMappingRule:create
global:admin	roleMappingRule:read
global:admin	roleMappingRule:update
global:admin	roleMappingRule:delete
global:admin	roleMappingRule:list
global:admin	workflow:publish
global:member	annotationTag:create
global:member	annotationTag:read
global:member	annotationTag:update
global:member	annotationTag:delete
global:member	annotationTag:list
global:member	eventBusDestination:test
global:member	eventBusDestination:list
global:member	tag:create
global:member	tag:read
global:member	tag:update
global:member	tag:list
global:member	user:list
global:member	variable:read
global:member	variable:list
global:member	insights:read
global:member	dataTable:list
global:member	mcp:oauth
global:member	mcpApiKey:create
global:member	mcpApiKey:rotate
global:member	chatHub:message
global:member	chatHubAgent:create
global:member	chatHubAgent:read
global:member	chatHubAgent:update
global:member	chatHubAgent:delete
global:member	chatHubAgent:list
global:member	apiKey:manage
global:member	credentialResolver:list
global:member	instanceAi:message
global:member	instanceAi:gateway
global:chatUser	chatHub:message
global:chatUser	chatHubAgent:create
global:chatUser	chatHubAgent:read
global:chatUser	chatHubAgent:update
global:chatUser	chatHubAgent:delete
global:chatUser	chatHubAgent:list
project:admin	workflow:unpublish
project:admin	credential:unshare
project:admin	credential:share
project:admin	credential:move
project:admin	credential:create
project:admin	credential:read
project:admin	credential:update
project:admin	credential:delete
project:admin	credential:list
project:admin	project:read
project:admin	project:update
project:admin	project:delete
project:admin	project:list
project:admin	sourceControl:push
project:admin	projectVariable:create
project:admin	projectVariable:read
project:admin	projectVariable:update
project:admin	projectVariable:delete
project:admin	projectVariable:list
project:admin	workflow:execute
project:admin	workflow:execute-chat
project:admin	workflow:move
project:admin	workflow:updateRedactionSetting
project:admin	workflow:create
project:admin	workflow:read
project:admin	workflow:update
project:admin	workflow:delete
project:admin	workflow:list
project:admin	folder:create
project:admin	folder:read
project:admin	folder:update
project:admin	folder:delete
project:admin	folder:list
project:admin	folder:move
project:admin	dataTable:create
project:admin	dataTable:read
project:admin	dataTable:update
project:admin	dataTable:delete
project:admin	dataTable:readRow
project:admin	dataTable:writeRow
project:admin	dataTable:listProject
project:admin	execution:reveal
project:admin	workflow:publish
project:personalOwner	workflow:unpublish
project:personalOwner	workflow:unshare
project:personalOwner	credential:unshare
project:personalOwner	credential:share
project:personalOwner	credential:move
project:personalOwner	credential:create
project:personalOwner	credential:read
project:personalOwner	credential:update
project:personalOwner	credential:delete
project:personalOwner	credential:list
project:personalOwner	project:read
project:personalOwner	project:list
project:personalOwner	workflow:share
project:personalOwner	workflow:execute
project:personalOwner	workflow:execute-chat
project:personalOwner	workflow:move
project:personalOwner	workflow:updateRedactionSetting
project:personalOwner	workflow:create
project:personalOwner	workflow:read
project:personalOwner	workflow:update
project:personalOwner	workflow:delete
project:personalOwner	workflow:list
project:personalOwner	folder:create
project:personalOwner	folder:read
project:personalOwner	folder:update
project:personalOwner	folder:delete
project:personalOwner	folder:list
project:personalOwner	folder:move
project:personalOwner	dataTable:create
project:personalOwner	dataTable:read
project:personalOwner	dataTable:update
project:personalOwner	dataTable:delete
project:personalOwner	dataTable:readRow
project:personalOwner	dataTable:writeRow
project:personalOwner	dataTable:listProject
project:personalOwner	execution:reveal
project:personalOwner	workflow:publish
project:editor	workflow:unpublish
project:editor	credential:create
project:editor	credential:read
project:editor	credential:update
project:editor	credential:delete
project:editor	credential:list
project:editor	project:read
project:editor	project:list
project:editor	projectVariable:create
project:editor	projectVariable:read
project:editor	projectVariable:update
project:editor	projectVariable:delete
project:editor	projectVariable:list
project:editor	workflow:execute
project:editor	workflow:execute-chat
project:editor	workflow:create
project:editor	workflow:read
project:editor	workflow:update
project:editor	workflow:delete
project:editor	workflow:list
project:editor	folder:create
project:editor	folder:read
project:editor	folder:update
project:editor	folder:delete
project:editor	folder:list
project:editor	dataTable:create
project:editor	dataTable:read
project:editor	dataTable:update
project:editor	dataTable:delete
project:editor	dataTable:readRow
project:editor	dataTable:writeRow
project:editor	dataTable:listProject
project:editor	workflow:publish
project:viewer	credential:read
project:viewer	credential:list
project:viewer	project:read
project:viewer	project:list
project:viewer	projectVariable:read
project:viewer	projectVariable:list
project:viewer	workflow:execute-chat
project:viewer	workflow:read
project:viewer	workflow:list
project:viewer	folder:read
project:viewer	folder:list
project:viewer	dataTable:read
project:viewer	dataTable:readRow
project:viewer	dataTable:listProject
project:chatUser	workflow:execute-chat
credential:owner	credential:unshare
credential:owner	credential:share
credential:owner	credential:move
credential:owner	credential:read
credential:owner	credential:update
credential:owner	credential:delete
credential:user	credential:read
workflow:owner	workflow:unpublish
workflow:owner	workflow:unshare
workflow:owner	workflow:share
workflow:owner	workflow:execute
workflow:owner	workflow:execute-chat
workflow:owner	workflow:move
workflow:owner	workflow:read
workflow:owner	workflow:update
workflow:owner	workflow:delete
workflow:owner	workflow:publish
workflow:editor	workflow:unpublish
workflow:editor	workflow:execute
workflow:editor	workflow:execute-chat
workflow:editor	workflow:read
workflow:editor	workflow:update
workflow:editor	workflow:publish
secretsProviderConnection:owner	externalSecretsProvider:sync
secretsProviderConnection:owner	externalSecretsProvider:read
secretsProviderConnection:owner	externalSecretsProvider:update
secretsProviderConnection:owner	externalSecretsProvider:delete
secretsProviderConnection:owner	externalSecretsProvider:list
secretsProviderConnection:owner	externalSecret:list
secretsProviderConnection:user	externalSecretsProvider:read
secretsProviderConnection:user	externalSecretsProvider:list
secretsProviderConnection:user	externalSecret:list
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."settings" ("key", "value", "loadOnStartup") FROM stdin;
ui.banners.dismissed	["V1"]	t
features.ldap	{"loginEnabled":false,"loginLabel":"","connectionUrl":"","allowUnauthorizedCerts":false,"connectionSecurity":"none","connectionPort":389,"baseDn":"","bindingAdminDn":"","bindingAdminPassword":"","firstNameAttribute":"","lastNameAttribute":"","emailAttribute":"","loginIdAttribute":"","ldapIdAttribute":"","userFilter":"","synchronizationEnabled":false,"synchronizationInterval":60,"searchPageSize":0,"searchTimeout":60,"enforceEmailUniqueness":true}	t
userManagement.isInstanceOwnerSetUp	true	t
mcp.access.enabled	true	t
\.


--
-- Data for Name: shared_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."shared_credentials" ("credentialsId", "projectId", "role", "createdAt", "updatedAt") FROM stdin;
Lwm7OCNgUYON0Xsb	O0pFdMJSB9FZDT1n	credential:owner	2026-05-05 05:23:35.608+00	2026-05-05 05:23:35.608+00
8p8BWUhmTZxFMNhj	O0pFdMJSB9FZDT1n	credential:owner	2026-05-05 05:29:01.802+00	2026-05-05 05:29:01.802+00
\.


--
-- Data for Name: shared_workflow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."shared_workflow" ("workflowId", "projectId", "role", "createdAt", "updatedAt") FROM stdin;
4PeZJJxDMiJE6tcE	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-01 21:43:52.214+00	2026-05-01 21:43:52.214+00
nv4NgSzjmvBxdIjO	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-01 23:27:35.77+00	2026-05-01 23:27:35.77+00
bbsdId4xX7PFvnn6	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-01 23:38:32.977+00	2026-05-01 23:38:32.977+00
1UIy7q3UXi42x3ry	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-02 06:21:00.473+00	2026-05-02 06:21:00.473+00
hJdXYdSDA8pMnD5H	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-02 16:00:58.73+00	2026-05-02 16:00:58.73+00
aHPyQ2bgeu7Ilrbd	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-02 16:02:07.246+00	2026-05-02 16:02:07.246+00
n04q3jqDCHcgYArg	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-02 17:08:13.031+00	2026-05-02 17:08:13.031+00
7JoImKafB7kqtzgS	O0pFdMJSB9FZDT1n	workflow:owner	2026-05-05 05:13:25.977+00	2026-05-05 05:13:25.977+00
\.


--
-- Data for Name: test_run; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."test_run" ("id", "workflowId", "status", "errorCode", "errorDetails", "runAt", "completedAt", "metrics", "createdAt", "updatedAt", "runningInstanceId", "cancelRequested") FROM stdin;
\.


--
-- Data for Name: test_case_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."test_case_execution" ("id", "testRunId", "executionId", "status", "runAt", "completedAt", "errorCode", "errorDetails", "metrics", "createdAt", "updatedAt", "inputs", "outputs") FROM stdin;
\.


--
-- Data for Name: token_exchange_jti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."token_exchange_jti" ("jti", "expiresAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: trusted_key_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."trusted_key_source" ("id", "type", "config", "status", "lastError", "lastRefreshedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: trusted_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."trusted_key" ("sourceId", "kid", "data", "createdAt") FROM stdin;
\.


--
-- Data for Name: user_api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_api_keys" ("id", "userId", "label", "apiKey", "createdAt", "updatedAt", "scopes", "audience") FROM stdin;
azfdLM1IlsAnIYI5	fea4af2e-1af7-42db-96f1-90c44eacc092	n8n	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmZWE0YWYyZS0xYWY3LTQyZGItOTZmMS05MGM0NGVhY2MwOTIiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwianRpIjoiYzk1NDFlZTgtYzgzYy00Y2VkLThjYmItMWY5YTM5MDI2Y2EyIiwiaWF0IjoxNzc3NzQzNDQ1fQ.0XLeoiVdNkVbAmb8SiwgL9FynEApccomcK8LxTKfJdo	2026-05-02 17:37:25.119+00	2026-05-02 19:56:46.035+00	["communityPackage:install","communityPackage:list","communityPackage:uninstall","communityPackage:update","credential:create","credential:delete","credential:list","credential:move","credential:read","credential:update","dataTable:create","dataTable:delete","dataTable:list","dataTable:read","dataTable:update","insights:read","project:create","project:delete","project:list","project:update","securityAudit:generate","sourceControl:pull","tag:create","tag:delete","tag:list","tag:read","tag:update","user:changeRole","user:create","user:delete","user:enforceMfa","user:list","user:read","variable:create","variable:delete","variable:list","variable:update","workflow:create","workflow:delete","workflow:list","workflow:move","workflow:read","workflow:update","workflowTags:update","workflowTags:list","executionTags:update","executionTags:list","workflow:activate","workflow:deactivate","execution:delete","execution:read","execution:retry","execution:stop","execution:list","dataTableRow:create","dataTableRow:read","dataTableRow:update","dataTableRow:delete","dataTableRow:upsert"]	public-api
\.


--
-- Data for Name: user_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_favorites" ("id", "userId", "resourceId", "resourceType") FROM stdin;
\.


--
-- Data for Name: variables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."variables" ("key", "type", "value", "id", "projectId") FROM stdin;
\.


--
-- Data for Name: webhook_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."webhook_entity" ("webhookPath", "method", "node", "webhookId", "pathLength", "workflowId") FROM stdin;
\.


--
-- Data for Name: workflow_builder_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_builder_session" ("id", "workflowId", "userId", "messages", "previousSummary", "createdAt", "updatedAt", "activeVersionCardId", "resumeAfterRestoreMessageId") FROM stdin;
\.


--
-- Data for Name: workflow_dependency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_dependency" ("id", "workflowId", "workflowVersionId", "dependencyType", "dependencyKey", "dependencyInfo", "indexVersionId", "createdAt", "publishedVersionId") FROM stdin;
2644	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.manualTrigger	{"nodeId":"c76fb40c-3396-4609-931f-8260037c887e","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2645	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"37fb294f-3147-4682-bd1e-14a5c5109e98","nodeVersion":4.2}	1	2026-05-02 20:00:54.306+00	\N
2646	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"deacd850-fcfb-42bc-b304-5eab52c92d19","nodeVersion":4.2}	1	2026-05-02 20:00:54.306+00	\N
2647	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.wait	{"nodeId":"d51b0ac5-10fb-4cee-84ad-2a3c611be8ba","nodeVersion":1.1}	1	2026-05-02 20:00:54.306+00	\N
2648	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.switch	{"nodeId":"c29fd93b-f072-446e-ac79-26d37ce9600e","nodeVersion":3.2}	1	2026-05-02 20:00:54.306+00	\N
2649	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"e617050b-e488-4009-afb1-499e472e7976","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2650	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"8d2fa3bd-c502-41e3-bb19-a9727362ab07","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2651	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.splitOut	{"nodeId":"ebab7405-f7d6-43ef-a1f9-6132110550c7","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2652	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.splitInBatches	{"nodeId":"104fb5e6-a6f8-408d-9863-d4667c9de8b6","nodeVersion":3}	1	2026-05-02 20:00:54.306+00	\N
2653	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"7904c30b-df0e-41d8-9ad1-5964dfdcf0ee","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2654	4PeZJJxDMiJE6tcE	117	credentialId	8TqqxRIs01XpYaLP	{"nodeId":"7904c30b-df0e-41d8-9ad1-5964dfdcf0ee","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2655	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"cbe5f3b0-635a-4a67-9fdb-d240a5698656","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2656	4PeZJJxDMiJE6tcE	117	credentialId	QWtydcr29Q4uCejS	{"nodeId":"cbe5f3b0-635a-4a67-9fdb-d240a5698656","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2657	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"8c63fc15-9d33-427d-b775-90dc0a658e2a","nodeVersion":1.8}	1	2026-05-02 20:00:54.306+00	\N
2658	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"3a6ff176-1e75-4cdf-967d-1c8f624be8ad","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2659	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"1a1a424b-dad6-480f-954f-0d9b5670fb95","nodeVersion":1.8}	1	2026-05-02 20:00:54.306+00	\N
2660	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"d2bcd3ab-684c-413b-8159-835365a78bae","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2661	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"be31d495-8a58-4979-92eb-354f74bb617a","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2662	4PeZJJxDMiJE6tcE	117	credentialId	QWtydcr29Q4uCejS	{"nodeId":"be31d495-8a58-4979-92eb-354f74bb617a","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2663	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"e8117fc3-eef5-4cef-97cf-54c08860e6e8","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2664	4PeZJJxDMiJE6tcE	117	credentialId	QWtydcr29Q4uCejS	{"nodeId":"e8117fc3-eef5-4cef-97cf-54c08860e6e8","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2539	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.manualTrigger	{"nodeId":"228711ee-8af9-4c9f-bafe-993937fd1a85","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2540	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"9f9547f3-b60f-4268-b983-45f92a3c02b2","nodeVersion":4.2}	1	2026-05-02 19:50:45.671+00	\N
2541	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"436a4e0c-1904-484b-9221-efe01738d17b","nodeVersion":4.2}	1	2026-05-02 19:50:45.671+00	\N
2542	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.wait	{"nodeId":"347f283b-62fd-4cc7-ad3e-e42820208766","nodeVersion":1.1}	1	2026-05-02 19:50:45.671+00	\N
2543	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.switch	{"nodeId":"159d0c90-3a97-416f-acef-16c696ae29a6","nodeVersion":3.2}	1	2026-05-02 19:50:45.671+00	\N
2544	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"f500ac03-1e7b-44a3-8fce-2a3fce70da67","nodeVersion":1.8}	1	2026-05-02 19:50:45.671+00	\N
2545	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"c45d7065-3697-4f05-bea2-fad67813ab2a","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2546	aHPyQ2bgeu7Ilrbd	18	credentialId	GnfbzlFRwyF3J707	{"nodeId":"c45d7065-3697-4f05-bea2-fad67813ab2a","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2547	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"b153c809-5694-4c07-b058-cc6e4e331610","nodeVersion":1.2}	1	2026-05-02 19:50:45.671+00	\N
2548	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.splitOut	{"nodeId":"1f47200d-aa7c-4124-b90c-95c68bd7e94c","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2549	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.splitInBatches	{"nodeId":"fb307152-d414-45b7-bafd-e1b921aa57f8","nodeVersion":3}	1	2026-05-02 19:50:45.671+00	\N
2550	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"9397b175-bafb-449f-bf4c-0403fe1f9641","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2551	aHPyQ2bgeu7Ilrbd	18	credentialId	scvHOoxKDnFxz9jf	{"nodeId":"9397b175-bafb-449f-bf4c-0403fe1f9641","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2552	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"48361bce-1819-4f0e-bf45-2af52bc8d5a5","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2553	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"e2c9bbb2-7588-49da-85a0-77a008c47725","nodeVersion":1.8}	1	2026-05-02 19:50:45.671+00	\N
2554	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"12ae07a3-3bae-4daa-b57e-c6de1b49f8f0","nodeVersion":1.2}	1	2026-05-02 19:50:45.671+00	\N
2555	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"6d9659a8-d183-4398-b507-70bd5609fbe3","nodeVersion":1.8}	1	2026-05-02 19:50:45.671+00	\N
2556	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"7f32a346-8939-49be-b4b8-fe1b910db180","nodeVersion":1.2}	1	2026-05-02 19:50:45.671+00	\N
2557	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"b4ab837e-af38-4770-a410-0877f80f8d42","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2558	aHPyQ2bgeu7Ilrbd	18	credentialId	scvHOoxKDnFxz9jf	{"nodeId":"b4ab837e-af38-4770-a410-0877f80f8d42","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2665	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"c89e1cf2-bf31-484d-97fd-49de584385ba","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2666	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.wait	{"nodeId":"09e3db00-e02e-410c-902c-ccff80f65dfc","nodeVersion":1.1}	1	2026-05-02 20:00:54.306+00	\N
2667	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"5d2f8cbf-0d8a-4d1e-bd0c-bf269060b36a","nodeVersion":4.2}	1	2026-05-02 20:00:54.306+00	\N
2559	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"e21806c0-beec-4323-9149-2eb1f289dde2","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2560	aHPyQ2bgeu7Ilrbd	18	credentialId	scvHOoxKDnFxz9jf	{"nodeId":"e21806c0-beec-4323-9149-2eb1f289dde2","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2561	aHPyQ2bgeu7Ilrbd	18	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"5a9f72ab-6b7e-4871-9920-d97c0699d227","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2562	aHPyQ2bgeu7Ilrbd	18	credentialId	GnfbzlFRwyF3J707	{"nodeId":"5a9f72ab-6b7e-4871-9920-d97c0699d227","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2563	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.wait	{"nodeId":"f5bbf69b-9f2d-4d91-8859-bf98b8597d64","nodeVersion":1.1}	1	2026-05-02 19:50:45.671+00	\N
2564	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"018022e4-032d-4996-8199-49378d8889b5","nodeVersion":4.2}	1	2026-05-02 19:50:45.671+00	\N
2565	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.youTube	{"nodeId":"8c0fb31a-b4f7-46e7-9b5b-56ebe5824b7d","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2566	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"4e2ca846-7527-4ce1-9d75-7769ac322ccd","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2567	aHPyQ2bgeu7Ilrbd	18	credentialId	scvHOoxKDnFxz9jf	{"nodeId":"4e2ca846-7527-4ce1-9d75-7769ac322ccd","nodeVersion":4.5}	1	2026-05-02 19:50:45.671+00	\N
2568	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"7071fda2-e88f-4614-9300-004fea9cb2e7","nodeVersion":1.2}	1	2026-05-02 19:50:45.671+00	\N
2569	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"abcab5cb-488e-4cbb-9085-1bfdf7340525","nodeVersion":1.2}	1	2026-05-02 19:50:45.671+00	\N
2570	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"b5721ae0-7ab4-410b-8ef6-25eef803d013","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
233	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.manualTrigger	{"nodeId":"3941733f-a23d-402b-ab3d-32f1f3f0d6a9","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
234	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"b66a0e84-845a-4739-9ca2-f2dd97b5a8de","nodeVersion":4.2}	1	2026-05-01 23:38:33.053+00	\N
235	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.wait	{"nodeId":"667a3af5-08dc-4b05-a5f9-76d24f0d64cc","nodeVersion":1.1}	1	2026-05-01 23:38:33.053+00	\N
236	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"81e4cec5-85a8-476e-9813-70e7cf85129c","nodeVersion":1.2}	1	2026-05-01 23:38:33.053+00	\N
237	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"9f6296c0-f1f5-4984-b94d-cc160ab37cbf","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
238	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"9f6fa130-128d-4171-9fc7-78d800008580","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
239	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.if	{"nodeId":"0e20e92c-55b2-4e44-a519-2ee54b1b8c69","nodeVersion":2.2}	1	2026-05-01 23:38:33.053+00	\N
240	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"d46e0303-eb0b-4d4f-9bf9-c61e1d577265","nodeVersion":4.5}	1	2026-05-01 23:38:33.053+00	\N
241	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.set	{"nodeId":"4954542f-171a-4eb3-a038-7c941052a770","nodeVersion":3.4}	1	2026-05-01 23:38:33.053+00	\N
242	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"e8db1b31-21fa-4b1e-9c98-eeb965a82af1","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
243	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"2d1603f0-8c89-4fe7-b058-7e22c9cf9bfb","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
244	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"4ec2b087-e0ae-49ab-9ba2-cd7e3d5563ef","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
245	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"a8314ad2-949f-476d-92e9-9408fcf20463","nodeVersion":4.5}	1	2026-05-01 23:38:33.053+00	\N
246	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"c0aca14a-194e-4cec-aaed-084e78486a36","nodeVersion":4.2}	1	2026-05-01 23:38:33.053+00	\N
247	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"64990394-1d99-470a-82db-42174c59ac95","nodeVersion":4.2}	1	2026-05-01 23:38:33.053+00	\N
248	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"8fddedcd-1d0b-43c9-8001-1b006ff02451","nodeVersion":4.2}	1	2026-05-01 23:38:33.053+00	\N
249	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.googleDrive	{"nodeId":"abc5ec3b-dcf4-486b-9368-17216bfcaae7","nodeVersion":3}	1	2026-05-01 23:38:33.053+00	\N
250	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"afeac8db-be1b-422b-9c2d-de150083de90","nodeVersion":4.2}	1	2026-05-01 23:38:33.053+00	\N
251	bbsdId4xX7PFvnn6	1	nodeType	@n8n/n8n-nodes-langchain.openAi	{"nodeId":"0328a4d1-198b-4ae0-a27e-5e9a39b6a5c3","nodeVersion":1.8}	1	2026-05-01 23:38:33.053+00	\N
252	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"32ef6c52-e7c8-46bd-94dc-9a68c1b64a9f","nodeVersion":4.5}	1	2026-05-01 23:38:33.053+00	\N
253	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"3c92c864-b015-42c8-92d1-44c6826346db","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
254	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"caa2ae49-c800-4403-9ef0-88403b466d69","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
255	bbsdId4xX7PFvnn6	1	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"573eb0dc-69ee-4707-a054-1fe6eaf6449d","nodeVersion":1}	1	2026-05-01 23:38:33.053+00	\N
2668	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.youTube	{"nodeId":"5bbf1818-0b87-4ce3-bf95-dca4e8ce1902","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2669	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"84d05eba-a3ca-4518-87db-4d01c9690d0c","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2670	4PeZJJxDMiJE6tcE	117	credentialId	QWtydcr29Q4uCejS	{"nodeId":"84d05eba-a3ca-4518-87db-4d01c9690d0c","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2671	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"7be40416-8edf-46b5-b44e-1f0fe5f077f5","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2672	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"3802b4f6-13ea-402a-a062-6e8ce612f60b","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2673	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"6abae8c7-a277-48f8-a681-46363bf176b3","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2674	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"5111f56f-5c4a-479d-8be7-42f2a470ecb1","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2675	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"5635d7a8-1b87-4c56-a214-de4a28ba771a","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2676	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"28f21373-d79b-48ac-816a-897e63b9b301","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2677	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"fab56f98-318c-4a99-9709-80792a9cd697","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2678	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"d6689093-191c-43de-892f-d3a043d4ed50","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2679	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"fbe38f01-7435-4c87-a4cf-3dcf488394f4","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2680	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"75ab7862-6fef-45bd-bfcd-5a543b21cdb8","nodeVersion":1.8}	1	2026-05-02 20:00:54.306+00	\N
2681	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"74a444fe-5693-4cd0-b5f0-ddcb8b490786","nodeVersion":4.2}	1	2026-05-02 20:00:54.306+00	\N
2682	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"c498e77b-f979-4389-9eca-b975a840002c","nodeVersion":4.2}	1	2026-05-02 20:00:54.306+00	\N
2683	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.wait	{"nodeId":"7cfe0ace-7c66-43a6-a9bb-46a0020ed2f3","nodeVersion":1.1}	1	2026-05-02 20:00:54.306+00	\N
2684	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.switch	{"nodeId":"652412c3-f0ab-44e4-84db-f96d52d50782","nodeVersion":3.2}	1	2026-05-02 20:00:54.306+00	\N
2685	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"7514fd11-3caf-47a3-833e-3ae901d0cddc","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2686	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"0854e48b-444a-4d91-a6ba-11015d32d61f","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2687	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.splitOut	{"nodeId":"eef4ec8e-87de-494b-8053-7924e7f8545a","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2688	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.splitInBatches	{"nodeId":"6299cf47-416c-4636-823e-c6e79bd8f174","nodeVersion":3}	1	2026-05-02 20:00:54.306+00	\N
2689	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"1b4f0845-e70c-40a7-8e76-844155795e29","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2690	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"0fa539a8-79fc-496b-b446-84166c2a55e5","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2691	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"248f3e06-7b4e-4abb-b5c9-ba525dc46202","nodeVersion":1.8}	1	2026-05-02 20:00:54.306+00	\N
2692	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"06cb6d3b-4236-4e37-99af-2ef05f6ad1dd","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2693	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"b00b75c8-0085-4484-960f-d3067546185d","nodeVersion":1.8}	1	2026-05-02 20:00:54.306+00	\N
2694	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"3f138f78-e78e-43a9-b2a7-6af930a0c668","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2695	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"b59dce80-9e8d-4056-ae48-24aa657e9a4d","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2696	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"bd34cccf-dd52-4da4-821f-d33965bd95ff","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2697	4PeZJJxDMiJE6tcE	117	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"7bd5b661-ae0e-4ee6-b8da-c88eb4b93dc1","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2698	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.wait	{"nodeId":"58b382bc-8923-4fce-9bba-04fd0800533e","nodeVersion":1.1}	1	2026-05-02 20:00:54.306+00	\N
2699	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"e2f37dd3-0a7b-434b-8c56-ea348bee6664","nodeVersion":4.2}	1	2026-05-02 20:00:54.306+00	\N
2700	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.youTube	{"nodeId":"87c9394d-88c6-4057-9243-88901ce9bb55","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2701	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"fd05c140-9371-4246-b0a7-1fd8df03f733","nodeVersion":4.5}	1	2026-05-02 20:00:54.306+00	\N
2702	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"a0c1a04a-71ea-46e9-afb5-28f9e6cfb3ec","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2703	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"f795582b-a89f-44cf-9253-933a52666bce","nodeVersion":1.2}	1	2026-05-02 20:00:54.306+00	\N
2704	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"d44de70e-6498-484a-816d-13c78a460e91","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2705	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"232adaf1-eb9a-41d1-bd39-27399b6437db","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2706	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"693539b6-2200-4ff0-bb04-6a6c36d372a4","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2707	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"8b7943cf-ac9c-4758-85be-707b282e3ece","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2708	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"0efc3757-4216-435a-8120-3fe7d1701baf","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2709	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"c564ac29-a0f3-4718-a8a7-5ced93cc4cb0","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2710	4PeZJJxDMiJE6tcE	117	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"4e6d4208-dfb1-480b-b04e-6e23d277baa7","nodeVersion":1}	1	2026-05-02 20:00:54.306+00	\N
2571	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"4fc67682-64da-4b0c-8f36-9e2e599d5a04","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2572	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"a3dec4ad-cfbc-4fb8-b34e-5c580a2d1935","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2573	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"97cee90d-3401-4917-8f2b-f8f7bb542688","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2574	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"d839b37f-44c5-4091-8084-27e41555ca03","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2575	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"5b5299b4-9f9f-4ce9-8fbe-0b1a2f07bff4","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
2185	n04q3jqDCHcgYArg	1	nodeType	@n8n/n8n-nodes-langchain.chatTrigger	{"nodeId":"ef4c6982-f746-4d48-944b-449f8bdbb69f","nodeVersion":1.1}	1	2026-05-02 17:08:13.069+00	\N
2186	n04q3jqDCHcgYArg	1	nodeType	@n8n/n8n-nodes-langchain.memoryBufferWindow	{"nodeId":"e6183978-5077-4252-9718-6b36b6a7cd74","nodeVersion":1.3}	1	2026-05-02 17:08:13.069+00	\N
2187	n04q3jqDCHcgYArg	1	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenAi	{"nodeId":"1719e956-f9c8-48f5-9744-ee62345a9f7d","nodeVersion":1.2}	1	2026-05-02 17:08:13.069+00	\N
2188	n04q3jqDCHcgYArg	1	nodeType	@n8n/n8n-nodes-langchain.toolSerpApi	{"nodeId":"f0815af7-da61-4863-9cfa-b35be836b59c","nodeVersion":1}	1	2026-05-02 17:08:13.069+00	\N
2189	n04q3jqDCHcgYArg	1	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"2d3b4012-bd5f-46d5-be6d-af1ede6c155b","nodeVersion":1.8}	1	2026-05-02 17:08:13.069+00	\N
2576	aHPyQ2bgeu7Ilrbd	18	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"6a0d9215-3041-4c09-9164-574266219e7d","nodeVersion":1}	1	2026-05-02 19:50:45.671+00	\N
1152	1UIy7q3UXi42x3ry	1	nodeType	n8n-nodes-base.executeWorkflowTrigger	{"nodeId":"c055762a-8fe7-4141-a639-df2372f30060","nodeVersion":1.1}	1	2026-05-02 06:21:00.541+00	\N
1153	1UIy7q3UXi42x3ry	1	nodeType	n8n-nodes-base.noOp	{"nodeId":"b5942df6-0160-4ef7-965d-57583acdc8aa"}	1	2026-05-02 06:21:00.541+00	\N
1820	hJdXYdSDA8pMnD5H	1	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"e64af857-c1a4-4c4d-8fbd-28fe29afd64a","nodeVersion":4.5}	1	2026-05-02 16:00:58.777+00	\N
1821	hJdXYdSDA8pMnD5H	1	credentialId	8MqVitRad5EHaynN	{"nodeId":"e64af857-c1a4-4c4d-8fbd-28fe29afd64a","nodeVersion":4.5}	1	2026-05-02 16:00:58.777+00	\N
1822	hJdXYdSDA8pMnD5H	1	credentialId	scvHOoxKDnFxz9jf	{"nodeId":"e64af857-c1a4-4c4d-8fbd-28fe29afd64a","nodeVersion":4.5}	1	2026-05-02 16:00:58.777+00	\N
1823	hJdXYdSDA8pMnD5H	1	nodeType	n8n-nodes-base.executeWorkflowTrigger	{"nodeId":"29a21ebb-8c71-4cb0-893b-90a348312221","nodeVersion":1.1}	1	2026-05-02 16:00:58.777+00	\N
1868	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"074556e5-0cb3-431d-b11f-3b398aa47aaa","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1869	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.splitOut	{"nodeId":"1fccc321-ef70-4fdd-8614-e23ae57455bd","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1870	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.splitInBatches	{"nodeId":"d43a365a-c9d0-47f7-8835-53103ab57af3","nodeVersion":3}	1	2026-05-02 16:01:28.727+00	\N
1871	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"36620307-9c3a-4b8a-98a8-82306e6094d6","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1872	nv4NgSzjmvBxdIjO	12	credentialId	8MqVitRad5EHaynN	{"nodeId":"36620307-9c3a-4b8a-98a8-82306e6094d6","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1873	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"1f8f2567-eca2-4336-84c4-d921d880882e","nodeVersion":1.8}	1	2026-05-02 16:01:28.727+00	\N
1874	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"1f8300c1-77b8-49ad-b025-0774914db3bb","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1875	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"6a409028-8068-4884-ad76-57923c820b9a","nodeVersion":1.8}	1	2026-05-02 16:01:28.727+00	\N
1876	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"d46a300a-3d03-4aa4-b0e8-78b76c44ec3b","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1877	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"60fdd57f-36b7-4f79-9a9d-4714072e244b","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1878	nv4NgSzjmvBxdIjO	12	credentialId	8MqVitRad5EHaynN	{"nodeId":"60fdd57f-36b7-4f79-9a9d-4714072e244b","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1879	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"11f45b80-4a78-4756-9217-37af69058647","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1880	nv4NgSzjmvBxdIjO	12	credentialId	8MqVitRad5EHaynN	{"nodeId":"11f45b80-4a78-4756-9217-37af69058647","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1881	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"3233df7e-7ca0-43a7-9932-f55673ad7ccf","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1882	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.wait	{"nodeId":"5fc5d48f-fa2e-42ae-9794-aaf07d318256","nodeVersion":1.1}	1	2026-05-02 16:01:28.727+00	\N
1883	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"5e63c4fd-3538-40f2-a5a9-a8f7820c955a","nodeVersion":4.2}	1	2026-05-02 16:01:28.727+00	\N
1884	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.youTube	{"nodeId":"dc5c3be5-32e6-4be9-9fbd-f0689beb5c13","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1885	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"6ce0ebdb-7777-4090-bc8f-951a8108bcbd","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1886	nv4NgSzjmvBxdIjO	12	credentialId	8MqVitRad5EHaynN	{"nodeId":"6ce0ebdb-7777-4090-bc8f-951a8108bcbd","nodeVersion":4.5}	1	2026-05-02 16:01:28.727+00	\N
1887	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"09517f4f-2f2c-421a-b736-85f150a46d59","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1888	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"36a90d85-93ed-4c7f-8d3b-64476655a1ad","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1889	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"542b67ca-d6e3-44c8-95cc-5bdb1625fd87","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1890	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"75466c3b-7939-4d5d-b961-0da73c785bf9","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1891	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"aee90aea-f785-4223-b2dc-fdbed5b15fa4","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1892	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"5987e031-f839-4d3c-a3c2-b0448a16bc4f","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1893	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"4d94755b-a17e-467a-9fbf-13de06164f36","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1894	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"3ff9f7c0-c67e-4be3-8898-94f6b09319b9","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1895	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"859f2708-de78-47c6-ae07-3dd5a48a5654","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1896	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.executeWorkflow	{"nodeId":"c3320576-ec48-40ac-a3e1-342f20c357b0","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1897	nv4NgSzjmvBxdIjO	12	workflowCall	hJdXYdSDA8pMnD5H	{"nodeId":"c3320576-ec48-40ac-a3e1-342f20c357b0","nodeVersion":1.2}	1	2026-05-02 16:01:28.727+00	\N
1861	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.manualTrigger	{"nodeId":"641476a6-77e3-4fd6-8d55-22057f09a8c4","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
1862	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"f8990e5b-3620-4639-b6c2-c32e28e449d3","nodeVersion":4.2}	1	2026-05-02 16:01:28.727+00	\N
1863	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"0d585371-0f9f-4e09-a45e-532185c78c88","nodeVersion":4.2}	1	2026-05-02 16:01:28.727+00	\N
1864	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.wait	{"nodeId":"71442215-1773-48e1-8dff-701131de023a","nodeVersion":1.1}	1	2026-05-02 16:01:28.727+00	\N
1865	nv4NgSzjmvBxdIjO	12	nodeType	n8n-nodes-base.switch	{"nodeId":"ed4550ab-a0f1-455f-8cd2-1be6933df6b4","nodeVersion":3.2}	1	2026-05-02 16:01:28.727+00	\N
1866	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"d317033c-f2cc-4ade-9dcb-277bf2571763","nodeVersion":1.8}	1	2026-05-02 16:01:28.727+00	\N
1867	nv4NgSzjmvBxdIjO	12	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"1163554c-9ff7-4b6a-a658-12e83d23c797","nodeVersion":1}	1	2026-05-02 16:01:28.727+00	\N
3243	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.manualTrigger	{"nodeId":"351e47da-99aa-4f1d-8036-1eca28cfcc97","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3244	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"304019d1-9ee4-4ea1-8674-e5591b7d628a","nodeVersion":4.2}	1	2026-05-05 05:35:22.317+00	\N
3245	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"426a34de-258e-4d18-9edb-905d50ce147a","nodeVersion":4.2}	1	2026-05-05 05:35:22.317+00	\N
3246	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.wait	{"nodeId":"63f2b31d-5a17-48a0-b883-69e007530b6d","nodeVersion":1.1}	1	2026-05-05 05:35:22.317+00	\N
3247	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.switch	{"nodeId":"1d6f6042-83c0-4fad-a039-ee76673e5875","nodeVersion":3.2}	1	2026-05-05 05:35:22.317+00	\N
3248	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"542f9843-c3e8-428b-8ba7-3784f7b09464","nodeVersion":1.8}	1	2026-05-05 05:35:22.317+00	\N
3249	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"ff5c2868-e733-4bae-afe2-df30a4ca24b0","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3250	7JoImKafB7kqtzgS	22	credentialId	Lwm7OCNgUYON0Xsb	{"nodeId":"ff5c2868-e733-4bae-afe2-df30a4ca24b0","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3251	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"6189c5f4-2cb3-4497-b817-558dc53e467b","nodeVersion":1.2}	1	2026-05-05 05:35:22.317+00	\N
3252	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.splitOut	{"nodeId":"bf79bd71-5e99-41d6-b552-0b78f3536986","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3253	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.splitInBatches	{"nodeId":"ccb3cf89-de70-4842-ba86-e2f3c187f31e","nodeVersion":3}	1	2026-05-05 05:35:22.317+00	\N
3254	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"fd3b02d8-dbcc-43b3-a59c-98f97cbf1ec3","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3255	7JoImKafB7kqtzgS	22	credentialId	8p8BWUhmTZxFMNhj	{"nodeId":"fd3b02d8-dbcc-43b3-a59c-98f97cbf1ec3","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3256	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"efd37d37-ebfb-499c-862a-f612a67d496b","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3257	7JoImKafB7kqtzgS	22	credentialId	8p8BWUhmTZxFMNhj	{"nodeId":"efd37d37-ebfb-499c-862a-f612a67d496b","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3258	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"0d2dd5de-1bb1-464d-82f6-f374cc09dff0","nodeVersion":1.8}	1	2026-05-05 05:35:22.317+00	\N
3259	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"2dd7170b-f88c-42c6-812d-21d2a8732f1f","nodeVersion":1.2}	1	2026-05-05 05:35:22.317+00	\N
3260	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.agent	{"nodeId":"52d81623-6c09-4a29-a312-51d7103dc12b","nodeVersion":1.8}	1	2026-05-05 05:35:22.317+00	\N
3261	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.outputParserStructured	{"nodeId":"74305372-0d03-44d2-a416-fa1708954dc9","nodeVersion":1.2}	1	2026-05-05 05:35:22.317+00	\N
3262	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"6dc624fe-71e8-4e5d-9841-68b8a16b5387","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3263	7JoImKafB7kqtzgS	22	credentialId	8p8BWUhmTZxFMNhj	{"nodeId":"6dc624fe-71e8-4e5d-9841-68b8a16b5387","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3264	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"e26082e5-86c1-4391-864a-c1dc03b21955","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3265	7JoImKafB7kqtzgS	22	credentialId	8p8BWUhmTZxFMNhj	{"nodeId":"e26082e5-86c1-4391-864a-c1dc03b21955","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3266	7JoImKafB7kqtzgS	22	nodeType	@n8n/n8n-nodes-langchain.lmChatOpenRouter	{"nodeId":"f6e42255-5dd9-445a-a44c-88744688e13f","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3267	7JoImKafB7kqtzgS	22	credentialId	Lwm7OCNgUYON0Xsb	{"nodeId":"f6e42255-5dd9-445a-a44c-88744688e13f","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3268	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.wait	{"nodeId":"3d42e1e9-73a3-4b2a-ad35-c471f4aec6fa","nodeVersion":1.1}	1	2026-05-05 05:35:22.317+00	\N
3269	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.httpRequest	{"nodeId":"2b44fd19-f705-46ea-93d1-0512d3443687","nodeVersion":4.2}	1	2026-05-05 05:35:22.317+00	\N
3270	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.youTube	{"nodeId":"d661c689-66d0-44ab-929b-584bd552e17f","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3271	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.googleSheets	{"nodeId":"10a89e73-1546-422b-8f9f-8412ddb6aefa","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3272	7JoImKafB7kqtzgS	22	credentialId	8p8BWUhmTZxFMNhj	{"nodeId":"10a89e73-1546-422b-8f9f-8412ddb6aefa","nodeVersion":4.5}	1	2026-05-05 05:35:22.317+00	\N
3273	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"05dbe6e4-1a38-469f-b3c5-5a1737430c92","nodeVersion":1.2}	1	2026-05-05 05:35:22.317+00	\N
3274	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.scheduleTrigger	{"nodeId":"6c69d852-58f8-438d-a9d7-e86655954825","nodeVersion":1.2}	1	2026-05-05 05:35:22.317+00	\N
3275	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"6ecca7da-ac54-4a95-bf4d-7d1a3365194f","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3276	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"172948a1-7036-4239-a4ae-1fdf43772baa","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3277	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"a9eb29e7-e30b-4025-87ba-60a0a61742c0","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3278	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"807c9c65-1a7d-4d54-8284-c1d89f876f7e","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3279	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"0b0cee35-9758-410b-8e5e-c00961544aba","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3280	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"b3c3ef7b-c024-42c8-a42f-4ed7e40e823d","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
3281	7JoImKafB7kqtzgS	22	nodeType	n8n-nodes-base.stickyNote	{"nodeId":"c37858b1-297a-4898-8b9d-84dfc6d0b99c","nodeVersion":1}	1	2026-05-05 05:35:22.317+00	\N
\.


--
-- Data for Name: workflow_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_history" ("versionId", "workflowId", "authors", "createdAt", "updatedAt", "nodes", "connections", "name", "autosaved", "description") FROM stdin;
d3a4bdc3-a84c-48c8-be1f-48b81867e620	7JoImKafB7kqtzgS	Jeffrey Llamas	2026-05-05 05:35:22.281+00	2026-05-05 05:35:22.281+00	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[-1712,256],"id":"351e47da-99aa-4f1d-8036-1eca28cfcc97","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[-560,160],"id":"304019d1-9ee4-4ea1-8674-e5591b7d628a","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[-112,160],"id":"426a34de-258e-4d18-9edb-905d50ce147a","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[336,256],"id":"63f2b31d-5a17-48a0-b883-69e007530b6d","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[112,32],"id":"1d6f6042-83c0-4fad-a039-ee76673e5875","name":"Switch"},{"parameters":{"promptType":"define","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation.","maxIterations":10}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[-1488,-704],"id":"542f9843-c3e8-428b-8ba7-3784f7b09464","name":"AI Agent"},{"parameters":{"model":"openrouter/free","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[-1416,-480],"id":"ff5c2868-e733-4bae-afe2-df30a4ca24b0","name":"4o-mini","credentials":{"openRouterApi":{"id":"Lwm7OCNgUYON0Xsb","name":"OpenRouter account"}}},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[-1712,-376],"id":"6189c5f4-2cb3-4497-b817-558dc53e467b","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[-1136,-704],"id":"bf79bd71-5e99-41d6-b552-0b78f3536986","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[-912,-704],"id":"ccb3cf89-de70-4842-ba86-e2f3c187f31e","name":"Loop Over Items"},{"parameters":{"documentId":{"__rl":true,"mode":"list","value":""},"sheetName":{"__rl":true,"mode":"list","value":""}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[-688,-704],"id":"fd3b02d8-dbcc-43b3-a59c-98f97cbf1ec3","name":"Add to Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"filtersUI":{"values":[{"lookupColumn":"Creation Status","lookupValue":"To Do"}]},"options":{"returnFirstMatch":true}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[-1488,160],"id":"efd37d37-ebfb-499c-862a-f612a67d496b","name":"Google Sheets","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[-1264,160],"id":"0d2dd5de-1bb1-464d-82f6-f374cc09dff0","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[-1128,384],"id":"2dd7170b-f88c-42c6-812d-21d2a8732f1f","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[-912,160],"id":"52d81623-6c09-4a29-a312-51d7103dc12b","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[-840,384],"id":"74305372-0d03-44d2-a416-fa1708954dc9","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[336,-168],"id":"6dc624fe-71e8-4e5d-9841-68b8a16b5387","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[336,24],"id":"e26082e5-86c1-4391-864a-c1dc03b21955","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[-1256,384],"id":"f6e42255-5dd9-445a-a44c-88744688e13f","name":"4o","credentials":{"openRouterApi":{"id":"Lwm7OCNgUYON0Xsb","name":"OpenRouter account"}}},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[-336,160],"id":"3d42e1e9-73a3-4b2a-ad35-c471f4aec6fa","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[560,-168],"id":"2b44fd19-f705-46ea-93d1-0512d3443687","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[784,-168],"id":"d661c689-66d0-44ab-929b-584bd552e17f","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1008,-168],"id":"10a89e73-1546-422b-8f9f-8412ddb6aefa","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"8p8BWUhmTZxFMNhj","name":"Google Sheets account"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[-1712,64],"id":"05dbe6e4-1a38-469f-b3c5-5a1737430c92","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[-1712,-704],"id":"6c69d852-58f8-438d-a9d7-e86655954825","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-1792,-832],"id":"6ecca7da-ac54-4a95-bf4d-7d1a3365194f","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-1840,-152],"id":"172948a1-7036-4239-a4ae-1fdf43772baa","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-436,-360],"id":"a9eb29e7-e30b-4025-87ba-60a0a61742c0","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[210,-288],"id":"807c9c65-1a7d-4d54-8284-c1d89f876f7e","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[34,4],"id":"0b0cee35-9758-410b-8e5e-c00961544aba","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[34,236],"id":"b3c3ef7b-c024-42c8-a42f-4ed7e40e823d","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[-1784,-936],"id":"c37858b1-297a-4898-8b9d-84dfc6d0b99c","name":"Sticky Note6"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"AI Agent":{"main":[[{"node":"Split Out","type":"main","index":0}]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Add to Sheet","type":"main","index":0}]]},"Add to Sheet":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	\N	t	\N
f0ef2ef0-d483-42a0-a3b1-c086e2ad2829	4PeZJJxDMiJE6tcE	Jeffrey Llamas	2026-05-02 20:03:09.064+00	2026-05-02 20:03:09.064+00	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[144,960],"id":"c76fb40c-3396-4609-931f-8260037c887e","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,784],"id":"37fb294f-3147-4682-bd1e-14a5c5109e98","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,1040],"id":"deacd850-fcfb-42bc-b304-5eab52c92d19","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[2192,1168],"id":"d51b0ac5-10fb-4cee-84ad-2a3c611be8ba","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[1632,1024],"id":"c29fd93b-f072-446e-ac79-26d37ce9600e","name":"Switch"},{"parameters":{"options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[768,400],"id":"e617050b-e488-4009-afb1-499e472e7976","name":"4o-mini"},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,400],"id":"8d2fa3bd-c502-41e3-bb19-a9727362ab07","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[1152,208],"id":"ebab7405-f7d6-43ef-a1f9-6132110550c7","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[1344,208],"id":"104fb5e6-a6f8-408d-9863-d4667c9de8b6","name":"Loop Over Items"},{"parameters":{"authentication":"serviceAccount","resource":"spreadsheet","operation":"deleteSpreadsheet","documentId":{"__rl":true,"mode":"url","value":"","__regex":"https:\\\\/\\\\/(?:drive|docs)\\\\.google\\\\.com(?:\\\\/.*|)\\\\/d\\\\/([0-9a-zA-Z\\\\-_]+)(?:\\\\/.*|)"}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1552,224],"id":"7904c30b-df0e-41d8-9ad1-5964dfdcf0ee","name":"Add to Sheet","credentials":{"googleApi":{"id":"8TqqxRIs01XpYaLP","name":"Google Sheets account 3"}}},{"parameters":{"documentId":{"__rl":true,"value":"","mode":"list","cachedResultName":"","cachedResultUrl":""},"sheetName":{"__rl":true,"value":"","mode":"list","cachedResultName":"","cachedResultUrl":""}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[368,864],"id":"cbe5f3b0-635a-4a67-9fdb-d240a5698656","name":"Google Sheets","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[560,864],"id":"8c63fc15-9d33-427d-b775-90dc0a658e2a","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[640,1088],"id":"3a6ff176-1e75-4cdf-967d-1c8f624be8ad","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[912,864],"id":"1a1a424b-dad6-480f-954f-0d9b5670fb95","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,1088],"id":"d2bcd3ab-684c-413b-8159-835365a78bae","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1968,720],"id":"be31d495-8a58-4979-92eb-354f74bb617a","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,960],"id":"e8117fc3-eef5-4cef-97cf-54c08860e6e8","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[832,1088],"id":"c89e1cf2-bf31-484d-97fd-49de584385ba","name":"4o"},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[1632,784],"id":"09e3db00-e02e-410c-902c-ccff80f65dfc","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[2192,720],"id":"5d2f8cbf-0d8a-4d1e-bd0c-bf269060b36a","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[2400,720],"id":"5bbf1818-0b87-4ce3-bf95-dca4e8ce1902","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2624,720],"id":"84d05eba-a3ca-4518-87db-4d01c9690d0c","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"QWtydcr29Q4uCejS","name":"Google Sheets account 2"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":11},{"triggerAtHour":14},{"triggerAtHour":18}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,768],"id":"7be40416-8edf-46b5-b44e-1f0fe5f077f5","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":11},{"triggerAtHour":14},{"triggerAtHour":16}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[624,208],"id":"3802b4f6-13ea-402a-a062-6e8ce612f60b","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[544,0],"id":"6abae8c7-a277-48f8-a681-46363bf176b3","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,624],"id":"5111f56f-5c4a-479d-8be7-42f2a470ecb1","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1312,624],"id":"5635d7a8-1b87-4c56-a214-de4a28ba771a","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,624],"id":"28f21373-d79b-48ac-816a-897e63b9b301","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,928],"id":"fab56f98-318c-4a99-9709-80792a9cd697","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,1120],"id":"d6689093-191c-43de-892f-d3a043d4ed50","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,0],"id":"fbe38f01-7435-4c87-a4cf-3dcf488394f4","name":"Sticky Note6"},{"parameters":{"promptType":"define","text":"Generate some ideas","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[3776,416],"id":"75ab7862-6fef-45bd-bfcd-5a543b21cdb8","name":"AI Agent"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets1').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro1').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro1').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro1').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro1').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[4384,992],"id":"74a444fe-5693-4cd0-b5f0-ddcb8b490786","name":"Generate Video1"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video1').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[4384,1248],"id":"c498e77b-f979-4389-9eca-b975a840002c","name":"Get Video1"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[5168,1376],"id":"7cfe0ace-7c66-43a6-a9bb-46a0020ed2f3","name":"10 Secs1","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[4608,1232],"id":"652412c3-f0ab-44e4-84db-f96d52d50782","name":"Switch1"},{"parameters":{"options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[3744,608],"id":"7514fd11-3caf-47a3-833e-3ae901d0cddc","name":"4o-mini1"},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[3984,608],"id":"0854e48b-444a-4d91-a6ba-11015d32d61f","name":"Structured Output Parser1"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[4128,416],"id":"eef4ec8e-87de-494b-8053-7924e7f8545a","name":"Split Out1"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[4320,416],"id":"6299cf47-416c-4636-823e-c6e79bd8f174","name":"Loop Over Items1"},{"parameters":{"operation":"append","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $json['output.topTenSubjects'] }}","Creation Status":"To Do","Posting Status":"To Do"},"matchingColumns":[],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[4528,432],"id":"1b4f0845-e70c-40a7-8e76-844155795e29","name":"Add to Sheet1"},{"parameters":{"documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"filtersUI":{"values":[{"lookupColumn":"Creation Status","lookupValue":"To Do"}]},"options":{"returnFirstMatch":true}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[3344,1072],"id":"0fa539a8-79fc-496b-b446-84166c2a55e5","name":"Google Sheets1"},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[3536,1072],"id":"248f3e06-7b4e-4abb-b5c9-ba525dc46202","name":"Intro & Outro1"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[3616,1296],"id":"06cb6d3b-4236-4e37-99af-2ef05f6ad1dd","name":"Intro & Outro Parser1"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets1').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[3888,1072],"id":"b00b75c8-0085-4484-960f-d3067546185d","name":"Ranker1"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[3984,1296],"id":"3f138f78-e78e-43a9-b2a7-6af930a0c668","name":"Rankings1"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets1').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video1').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[4944,928],"id":"b59dce80-9e8d-4056-ae48-24aa657e9a4d","name":"Created Video1"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets1').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[5168,1168],"id":"bd34cccf-dd52-4da4-821f-d33965bd95ff","name":"Error1"},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[3808,1296],"id":"7bd5b661-ae0e-4ee6-b8da-c88eb4b93dc1","name":"4o1"},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[4608,992],"id":"58b382bc-8923-4fce-9bba-04fd0800533e","name":"150 Secs1","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video1').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[5168,928],"id":"e2f37dd3-0a7b-434b-8c56-ea348bee6664","name":"Download Video1"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video1').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video1').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[5376,928],"id":"87c9394d-88c6-4057-9243-88901ce9bb55","name":"YouTube1"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets1').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[5600,928],"id":"fd05c140-9371-4246-b0a7-1fd8df03f733","name":"Update Sheet1"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[3120,976],"id":"a0c1a04a-71ea-46e9-afb5-28f9e6cfb3ec","name":"Schedule Trigger2"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[3600,416],"id":"f795582b-a89f-44cf-9253-933a52666bce","name":"Schedule Trigger3"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[3520,208],"id":"d44de70e-6498-484a-816d-13c78a460e91","name":"Sticky Note7"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[2976,832],"id":"232adaf1-eb9a-41d1-bd39-27399b6437db","name":"Sticky Note8"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4288,832],"id":"693539b6-2200-4ff0-bb04-6a6c36d372a4","name":"Sticky Note9"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4816,832],"id":"8b7943cf-ac9c-4758-85be-707b282e3ece","name":"Sticky Note10"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4816,1136],"id":"0efc3757-4216-435a-8120-3fe7d1701baf","name":"Sticky Note11"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[4816,1328],"id":"c564ac29-a0f3-4718-a8a7-5ced93cc4cb0","name":"Sticky Note12"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[2976,208],"id":"4e6d4208-dfb1-480b-b04e-6e23d277baa7","name":"Sticky Note13"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[]]},"Structured Output Parser":{"ai_outputParser":[[]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Add to Sheet","type":"main","index":0}]]},"Add to Sheet":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[]]},"AI Agent":{"main":[[{"node":"Split Out1","type":"main","index":0}]]},"Generate Video1":{"main":[[{"node":"150 Secs1","type":"main","index":0}]]},"Get Video1":{"main":[[{"node":"Switch1","type":"main","index":0}]]},"10 Secs1":{"main":[[{"node":"Get Video1","type":"main","index":0}]]},"Switch1":{"main":[[{"node":"Created Video1","type":"main","index":0}],[{"node":"Error1","type":"main","index":0}],[{"node":"10 Secs1","type":"main","index":0}],[{"node":"10 Secs1","type":"main","index":0}]]},"4o-mini1":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"Structured Output Parser1":{"ai_outputParser":[[{"node":"AI Agent","type":"ai_outputParser","index":0}]]},"Split Out1":{"main":[[{"node":"Loop Over Items1","type":"main","index":0}]]},"Loop Over Items1":{"main":[[],[{"node":"Add to Sheet1","type":"main","index":0}]]},"Add to Sheet1":{"main":[[{"node":"Loop Over Items1","type":"main","index":0}]]},"Google Sheets1":{"main":[[{"node":"Intro & Outro1","type":"main","index":0}]]},"Intro & Outro1":{"main":[[{"node":"Ranker1","type":"main","index":0}]]},"Intro & Outro Parser1":{"ai_outputParser":[[{"node":"Intro & Outro1","type":"ai_outputParser","index":0}]]},"Ranker1":{"main":[[{"node":"Generate Video1","type":"main","index":0}]]},"Rankings1":{"ai_outputParser":[[{"node":"Ranker1","type":"ai_outputParser","index":0}]]},"Created Video1":{"main":[[{"node":"Download Video1","type":"main","index":0}]]},"4o1":{"ai_languageModel":[[{"node":"Intro & Outro1","type":"ai_languageModel","index":0},{"node":"Ranker1","type":"ai_languageModel","index":0}]]},"150 Secs1":{"main":[[{"node":"Get Video1","type":"main","index":0}]]},"Download Video1":{"main":[[{"node":"YouTube1","type":"main","index":0}]]},"YouTube1":{"main":[[{"node":"Update Sheet1","type":"main","index":0}]]},"Schedule Trigger2":{"main":[[{"node":"Google Sheets1","type":"main","index":0}]]},"Schedule Trigger3":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	\N	f	\N
4ade281b-1c9a-44a2-930b-cbcbbfee06c2	aHPyQ2bgeu7Ilrbd	Jeffrey Llamas	2026-05-02 20:05:21.168+00	2026-05-02 20:05:21.168+00	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[144,960],"id":"228711ee-8af9-4c9f-bafe-993937fd1a85","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,784],"id":"9f9547f3-b60f-4268-b983-45f92a3c02b2","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1408,1040],"id":"436a4e0c-1904-484b-9221-efe01738d17b","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[2192,1168],"id":"347f283b-62fd-4cc7-ad3e-e42820208766","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[1632,1024],"id":"159d0c90-3a97-416f-acef-16c696ae29a6","name":"Switch"},{"parameters":{"hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[800,208],"id":"f500ac03-1e7b-44a3-8fce-2a3fce70da67","name":"AI Agent"},{"parameters":{"model":"=openrouter/auto","options":{"maxTokens":-1}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[768,400],"id":"c45d7065-3697-4f05-bea2-fad67813ab2a","name":"4o-mini","credentials":{"openRouterApi":{"id":"GnfbzlFRwyF3J707","name":"OpenRouter account"}}},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,400],"id":"b153c809-5694-4c07-b058-cc6e4e331610","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[1152,208],"id":"1f47200d-aa7c-4124-b90c-95c68bd7e94c","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[1344,208],"id":"fb307152-d414-45b7-bafd-e1b921aa57f8","name":"Loop Over Items"},{"parameters":{"resource":"spreadsheet","options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1552,224],"id":"9397b175-bafb-449f-bf4c-0403fe1f9641","name":"Add to Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"resource":"spreadsheet","options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[368,864],"id":"48361bce-1819-4f0e-bf45-2af52bc8d5a5","name":"Google Sheets"},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[560,864],"id":"e2c9bbb2-7588-49da-85a0-77a008c47725","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[640,1088],"id":"12ae07a3-3bae-4daa-b57e-c6de1b49f8f0","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[912,864],"id":"6d9659a8-d183-4398-b507-70bd5609fbe3","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1008,1088],"id":"7f32a346-8939-49be-b4b8-fe1b910db180","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1968,720],"id":"b4ab837e-af38-4770-a410-0877f80f8d42","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,960],"id":"e21806c0-beec-4323-9149-2eb1f289dde2","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[832,1088],"id":"5a9f72ab-6b7e-4871-9920-d97c0699d227","name":"4o","credentials":{"openRouterApi":{"id":"GnfbzlFRwyF3J707","name":"OpenRouter account"}}},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[1632,784],"id":"f5bbf69b-9f2d-4d91-8859-bf98b8597d64","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[2192,720],"id":"018022e4-032d-4996-8199-49378d8889b5","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[2400,720],"id":"8c0fb31a-b4f7-46e7-9b5b-56ebe5824b7d","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2624,720],"id":"4e2ca846-7527-4ce1-9d75-7769ac322ccd","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,768],"id":"7071fda2-e88f-4614-9300-004fea9cb2e7","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[624,208],"id":"abcab5cb-488e-4cbb-9085-1bfdf7340525","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[544,0],"id":"b5721ae0-7ab4-410b-8ef6-25eef803d013","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,624],"id":"4fc67682-64da-4b0c-8f36-9e2e599d5a04","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1312,624],"id":"a3dec4ad-cfbc-4fb8-b34e-5c580a2d1935","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,624],"id":"97cee90d-3401-4917-8f2b-f8f7bb542688","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,928],"id":"d839b37f-44c5-4091-8084-27e41555ca03","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1840,1120],"id":"5b5299b4-9f9f-4ce9-8fbe-0b1a2f07bff4","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,0],"id":"6a0d9215-3041-4c09-9164-574266219e7d","name":"Sticky Note6"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"AI Agent":{"main":[[{"node":"Split Out","type":"main","index":0}]]},"Structured Output Parser":{"ai_outputParser":[[{"node":"AI Agent","type":"ai_outputParser","index":0}]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Add to Sheet","type":"main","index":0}]]},"Add to Sheet":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	\N	f	\N
45c09d69-21d4-49b4-b2b1-1a6c81f4d25d	n04q3jqDCHcgYArg	Jeffrey Llamas	2026-05-02 20:05:29.053+00	2026-05-02 20:05:29.053+00	[{"parameters":{"options":{}},"id":"ef4c6982-f746-4d48-944b-449f8bdbb69f","name":"When chat message received","type":"@n8n/n8n-nodes-langchain.chatTrigger","position":[368,240],"webhookId":"53c136fe-3e77-4709-a143-fe82746dd8b6","typeVersion":1.1},{"parameters":{},"id":"e6183978-5077-4252-9718-6b36b6a7cd74","name":"Simple Memory","type":"@n8n/n8n-nodes-langchain.memoryBufferWindow","position":[720,464],"typeVersion":1.3},{"parameters":{"model":{"__rl":true,"mode":"list","value":"gpt-4o-mini"},"options":{}},"id":"1719e956-f9c8-48f5-9744-ee62345a9f7d","name":"OpenAI Chat Model","type":"@n8n/n8n-nodes-langchain.lmChatOpenAi","position":[576,464],"typeVersion":1.2},{"parameters":{"options":{}},"id":"f0815af7-da61-4863-9cfa-b35be836b59c","name":"SerpAPI","type":"@n8n/n8n-nodes-langchain.toolSerpApi","position":[848,464],"typeVersion":1},{"parameters":{"options":{}},"id":"2d3b4012-bd5f-46d5-be6d-af1ede6c155b","name":"AI Agent","type":"@n8n/n8n-nodes-langchain.agent","position":[608,240],"typeVersion":1.8}]	{"SerpAPI":{"ai_tool":[[{"node":"AI Agent","type":"ai_tool","index":0}]]},"Simple Memory":{"ai_memory":[[{"node":"AI Agent","type":"ai_memory","index":0}]]},"OpenAI Chat Model":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"When chat message received":{"main":[[{"node":"AI Agent","type":"main","index":0}]]}}	\N	f	\N
cdb1ea68-1896-4246-a3be-713dc82491e9	nv4NgSzjmvBxdIjO	Jeffrey Llamas	2026-05-02 20:05:37.517+00	2026-05-02 20:05:37.517+00	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[144,960],"id":"641476a6-77e3-4fd6-8d55-22057f09a8c4","name":"When clicking ‘Test workflow’"},{"parameters":{"method":"POST","url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"specifyBody":"json","jsonBody":"={\\n  \\"template\\": \\"9XtfsD0C3Tb2vbvfc84d\\",\\n  \\"variables\\": {\\n    \\"title\\": \\"{{ $('Google Sheets').item.json.Subject }}\\",\\n    \\"voiceModel\\": \\"elevenlabs\\",\\n    \\"voice.ConnectionID\\": \\"my-elevenlabs-connection\\",\\n    \\"voiceID\\": \\"21m00Tcm4TlvDq8ikWAM\\",\\n    \\"imageModel\\": \\"flux-pro\\",\\n    \\"introImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.introImagePrompt }}\\",\\n    \\"introVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.introVoiceoverText }}\\",\\n    \\"outroImagePrompt\\": \\"{{ $('Intro & Outro').item.json.output.outroImagePrompt }}\\",\\n    \\"outroVoiceoverText\\": \\"{{ $('Intro & Outro').item.json.output.outroVoiceoverText }}\\",\\n    \\"ranking\\": [\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[0].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[0].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[0].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[1].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[1].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[1].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[2].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[2].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[2].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[3].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[3].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[3].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[4].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[4].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[4].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[5].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[5].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[5].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[6].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[6].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[6].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[7].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[7].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[7].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[8].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[8].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[8].lowerThirdText }}\\"\\n      },\\n      {\\n        \\"voiceoverText\\": \\"{{ $json.output[9].voiceoverText }}\\",\\n        \\"imagePrompt\\": \\"{{ $json.output[9].imagePrompt }}\\",\\n        \\"lowerThirdText\\": \\"{{ $json.output[9].lowerThirdText }}\\"\\n      }\\n    ]\\n  }\\n}","options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1296,864],"id":"f8990e5b-3620-4639-b6c2-c32e28e449d3","name":"Generate Video"},{"parameters":{"url":"https://api.json2video.com/v2/movies","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendQuery":true,"queryParameters":{"parameters":[{"name":"project","value":"={{ $('Generate Video').item.json.project }}"}]},"options":{"redirect":{"redirect":{}}}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[1744,864],"id":"0d585371-0f9f-4e09-a45e-532185c78c88","name":"Get Video"},{"parameters":{"amount":10},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[2192,960],"id":"71442215-1773-48e1-8dff-701131de023a","name":"10 Secs","webhookId":"4ed8db71-25d8-484b-a6e9-23f411ed040d"},{"parameters":{"rules":{"values":[{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"5b858d82-0a7c-44ea-940b-ae83a7c22f3c","leftValue":"={{ $json.movie.status }}","rightValue":"done","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Done"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"leftValue":"={{ $json.movie.status }}","rightValue":"error","operator":{"type":"string","operation":"equals"},"id":"2e627457-06c8-411e-b6e0-f2e0207a3882"}],"combinator":"and"},"renameOutput":true,"outputKey":"Error"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"6ebbf3c8-599e-451d-acf6-4e63fef69ae0","leftValue":"={{ $json.movie.status }}","rightValue":"running","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Running"},{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"conditions":[{"id":"e22298ac-6f08-4f73-a361-768a17ea9a3a","leftValue":"={{ $json.movie.status }}","rightValue":"preparing","operator":{"type":"string","operation":"equals","name":"filter.operator.equals"}}],"combinator":"and"},"renameOutput":true,"outputKey":"Preparing"}]},"options":{}},"type":"n8n-nodes-base.switch","typeVersion":3.2,"position":[1968,736],"id":"ed4550ab-a0f1-455f-8cd2-1be6933df6b4","name":"Switch"},{"parameters":{"promptType":"define","text":"Generate some ideas","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are an AI that generates creative and engaging subject ideas for \\"Top Ten Rankings\\" videos. Return an array of 10 distinct subject ideas, where each idea is no more than 4 words long. Subjects must be timeless and should not require real-time or current events knowledge. Focus on evergreen topics such as \\"cities in the US\\", \\"breakfast meals\\", or \\"clothing brands\\".\\n\\nOutput only the array of subject ideas, with no extra explanation."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[368,208],"id":"d317033c-f2cc-4ade-9dcb-277bf2571763","name":"AI Agent"},{"parameters":{"options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[376,432],"id":"1163554c-9ff7-4b6a-a658-12e83d23c797","name":"4o-mini"},{"parameters":{"jsonSchemaExample":"{\\n  \\"topTenSubjects\\": [\\n    \\"Cities in the US\\",\\n    \\"Breakfast meals\\",\\n    \\"Clothing brands\\",\\n    \\"Fictional villains\\",\\n    \\"Luxury cars\\",\\n    \\"Fast food chains\\",\\n    \\"Theme parks\\",\\n    \\"Mobile apps\\",\\n    \\"Board games\\",\\n    \\"Movie soundtracks\\"\\n  ]\\n}\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[504,432],"id":"074556e5-0cb3-431d-b11f-3b398aa47aaa","name":"Structured Output Parser"},{"parameters":{"fieldToSplitOut":"output.topTenSubjects","options":{}},"type":"n8n-nodes-base.splitOut","typeVersion":1,"position":[720,208],"id":"1fccc321-ef70-4fdd-8614-e23ae57455bd","name":"Split Out"},{"parameters":{"options":{}},"type":"n8n-nodes-base.splitInBatches","typeVersion":3,"position":[944,208],"id":"d43a365a-c9d0-47f7-8835-53103ab57af3","name":"Loop Over Items"},{"parameters":{"documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"filtersUI":{"values":[{"lookupColumn":"Creation Status","lookupValue":"To Do"}]},"options":{"returnFirstMatch":true}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[368,864],"id":"36620307-9c3a-4b8a-98a8-82306e6094d6","name":"Google Sheets","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"promptType":"define","text":"=Subject: {{ $json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant that helps generate engaging content for \\"Top Ten Rankings\\" videos on various topics. Your job is to take a subject (e.g., \\"breakfast foods\\", \\"action movies\\", \\"smartphones\\", etc.) and create two parts of the script: an intro and an outro. Each part includes a voiceover script and a corresponding visual image prompt.\\n\\n## Instructions\\nGenerate the following for the given subject:\\n\\n1) introVoiceoverText – Write a short, energetic introduction to the video. It should welcome viewers to the countdown, mention the subject, and create excitement or curiosity about the list.\\n\\nExample: \\"Welcome to our Top 10 countdown of the most popular breakfast foods around the world. Whether you're looking for something hearty or sweet, you won't want to miss this delicious lineup!\\"\\n\\n2) introImagePrompt – Write a visual prompt that reflects the theme of the introVoiceoverText. This should describe a visually appealing scene that matches the subject and tone of the intro.\\n\\nExample: \\"A colorful, high-resolution spread of global breakfast foods on a rustic wooden table, with steam rising and morning sunlight pouring in through a window.\\"\\n\\n3) outroVoiceoverText – Write a warm and satisfying conclusion to the video. It should recap the excitement of the list, encourage viewer engagement (e.g., asking for favorites), and thank the audience for watching.\\n\\nExample: \\"There you have it! The Top 10 breakfast foods that bring joy to mornings worldwide. Which one is your favorite? Thank you for joining us!\\"\\n\\n4) outroImagePrompt – Write a visual prompt that matches the outroVoiceoverText. It should reflect the conclusion and theme of the video in a visually appealing way.\\n\\nExample: \\"A cozy breakfast table with empty plates and coffee cups, soft morning light, and a handwritten 'Thanks for watching!' note.\\"\\n\\n\\n## Final Reminders\\nKeep the tone fun, informative, and visually descriptive. Always match the tone and imagery to the given subject."}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[592,864],"id":"1f8f2567-eca2-4336-84c4-d921d880882e","name":"Intro & Outro"},{"parameters":{"jsonSchemaExample":"{\\n  \\"introVoiceoverText\\": \\"[INTRO_VOICEOVER_TEXT]\\",\\n  \\"introImagePrompt\\": \\"[INTRO_IMAGE_PROMPT]\\",\\n  \\"outroVoiceoverText\\": \\"[OUTRO_VOICEOVER_TEXT]\\",\\n  \\"outroImagePrompt\\": \\"[OUTRO_IMAGE_PROMPT]\\"\\n}"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[728,1088],"id":"1f8300c1-77b8-49ad-b025-0774914db3bb","name":"Intro & Outro Parser"},{"parameters":{"promptType":"define","text":"=Subject: {{ $('Google Sheets').item.json.Subject }}","hasOutputParser":true,"options":{"systemMessage":"=# Overview\\nYou are a creative assistant for a Top Ten Rankings video channel. Your task is to generate a full Top 10 countdown for a given subject. Your output must include 10 ranked items, starting from number 10 and counting down to number 1.\\n\\n## Instructions\\nFor each ranked item, generate the following:\\n\\n1) voiceoverText – A 2–3 sentence script that introduces the item and explains why it earned its spot. Always start by stating the rank and name of the item.\\n\\nExample: \\"Starting off our list at number 10, it's the classic British breakfast. This hearty meal includes fried eggs, bacon, sausages, baked beans, and toast—perfect for a filling start to the day.\\"\\n\\n2) imagePrompt – A descriptive prompt for an image that visually represents the item in the voiceover.\\n\\nExample: \\"A traditional full English breakfast on a plate with fried eggs, crispy bacon, sausages, baked beans, tomatoes, and buttered toast, all beautifully arranged.\\"\\n\\n3) lowerThirdText – A short title or name of the item that appears on screen as a label.\\n\\nExample: \\"English Breakfast\\"\\n\\n## Important Rules:\\n- Always start with number 10 and count down to number 1.\\n- Make sure each voiceoverText is concise (2–3 sentences).\\n- Ensure the imagePrompt clearly matches the visuals described in the voiceover.\\n- Keep the tone consistent with the subject (fun, informative, dramatic, etc., depending on the topic).\\n- Use variety in language so that each entry feels fresh and not repetitive.\\n\\n## Output Format\\nReturn your results as a JSON array with 10 objects, where each object contains:\\n- voiceoverText (string)\\n- imagePrompt (string)\\n- lowerThirdText (string)\\n"}},"type":"@n8n/n8n-nodes-langchain.agent","typeVersion":1.8,"position":[944,864],"id":"6a409028-8068-4884-ad76-57923c820b9a","name":"Ranker"},{"parameters":{"jsonSchemaExample":"[\\n  {\\n    \\"voiceoverText\\": \\"Starting off our list at number 10, it's [Item Name]. [Brief description or interesting fact].\\",\\n    \\"imagePrompt\\": \\"A detailed image of [Item Name], featuring [visual elements that match the voiceover].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 9, we have [Item Name]. [Short reason why it's on the list].\\",\\n    \\"imagePrompt\\": \\"A vivid image of [Item Name], with [key visual features or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 8 is [Item Name]. [Notable feature or context].\\",\\n    \\"imagePrompt\\": \\"An image showing [Item Name] with [descriptive visual elements].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Number 7 goes to [Item Name]. [Quick fun fact or explanation].\\",\\n    \\"imagePrompt\\": \\"A well-lit image of [Item Name] in [relevant setting or action].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"At number 6, it's [Item Name]. [Highlight of appeal or significance].\\",\\n    \\"imagePrompt\\": \\"A close-up of [Item Name], showing [specific features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Halfway through at number 5, we have [Item Name]. [Interesting detail about it].\\",\\n    \\"imagePrompt\\": \\"An eye-catching scene with [Item Name], featuring [key visuals].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Coming in at number 4 is [Item Name]. [Why it’s a standout choice].\\",\\n    \\"imagePrompt\\": \\"A bold image of [Item Name] with [supporting visual context].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Taking the number 3 spot is [Item Name]. [Brief praise or fun fact].\\",\\n    \\"imagePrompt\\": \\"A striking photo of [Item Name], highlighting [notable characteristics].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"Just shy of the top spot at number 2, it's [Item Name]. [Short reason for its high rank].\\",\\n    \\"imagePrompt\\": \\"A dynamic image of [Item Name] in [action or setting].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  },\\n  {\\n    \\"voiceoverText\\": \\"And finally, at number 1, it's [Item Name]. [Final compelling reason it tops the list].\\",\\n    \\"imagePrompt\\": \\"A stunning visual of [Item Name], with [memorable and defining features].\\",\\n    \\"lowerThirdText\\": \\"[Item Name]\\"\\n  }\\n]\\n"},"type":"@n8n/n8n-nodes-langchain.outputParserStructured","typeVersion":1.2,"position":[1016,1088],"id":"d46a300a-3d03-4aa4-b0e8-78b76c44ec3b","name":"Rankings"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Creation Status":"Created","Video URL":"={{ $('Get Video').item.json.movie.url }}"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,536],"id":"60fdd57f-36b7-4f79-9a9d-4714072e244b","name":"Created Video","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Video URL":"Error"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2192,728],"id":"11f45b80-4a78-4756-9217-37af69058647","name":"Error","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"model":"openai/gpt-4o","options":{}},"type":"@n8n/n8n-nodes-langchain.lmChatOpenRouter","typeVersion":1,"position":[600,1088],"id":"3233df7e-7ca0-43a7-9932-f55673ad7ccf","name":"4o"},{"parameters":{"amount":150},"type":"n8n-nodes-base.wait","typeVersion":1.1,"position":[1520,864],"id":"5fc5d48f-fa2e-42ae-9794-aaf07d318256","name":"150 Secs","webhookId":"3922e8b8-aa6c-44c3-9773-49b59d59bb53"},{"parameters":{"url":"={{ $('Get Video').item.json.movie.url }}","options":{}},"type":"n8n-nodes-base.httpRequest","typeVersion":4.2,"position":[2416,536],"id":"5e63c4fd-3538-40f2-a5a9-a8f7820c955a","name":"Download Video"},{"parameters":{"resource":"video","operation":"upload","title":"=Top Ten: {{ $('Created Video').item.json.Subject }}","regionCode":"US","categoryId":"1","options":{"description":"=Our Top Ten Rankings of {{ $('Created Video').item.json.Subject }}. Do you agree with us? Let us know in the comments!👇","privacyStatus":"unlisted"}},"type":"n8n-nodes-base.youTube","typeVersion":1,"position":[2640,536],"id":"dc5c3be5-32e6-4be9-9fbd-f0689beb5c13","name":"YouTube"},{"parameters":{"operation":"update","documentId":{"__rl":true,"value":"1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78","mode":"list","cachedResultName":"Top Ten Videos","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit?usp=drivesdk"},"sheetName":{"__rl":true,"value":"gid=0","mode":"list","cachedResultName":"Sheet1","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1WiP9AicckkynsK8E_CUqSh_IvEy5bJMtXr4qHo-Kf78/edit#gid=0"},"columns":{"mappingMode":"defineBelow","value":{"Subject":"={{ $('Google Sheets').item.json.Subject }}","Posting Status":"Unlisted"},"matchingColumns":["Subject"],"schema":[{"id":"Subject","displayName":"Subject","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":false},{"id":"Creation Status","displayName":"Creation Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"Posting Status","displayName":"Posting Status","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true},{"id":"Video URL","displayName":"Video URL","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"removed":true},{"id":"row_number","displayName":"row_number","required":false,"defaultMatch":false,"display":true,"type":"string","canBeUsedToMatch":true,"readOnly":true,"removed":true}],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[2864,536],"id":"6ce0ebdb-7777-4090-bc8f-951a8108bcbd","name":"Update Sheet","credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"}}},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,768],"id":"09517f4f-2f2c-421a-b736-85f150a46d59","name":"Schedule Trigger"},{"parameters":{"rule":{"interval":[{"triggerAtHour":10}]}},"type":"n8n-nodes-base.scheduleTrigger","typeVersion":1.2,"position":[144,208],"id":"36a90d85-93ed-4c7f-8d3b-64476655a1ad","name":"Schedule Trigger1"},{"parameters":{"content":"# Idea Generator\\n","height":600,"width":1280,"color":2},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[64,-24],"id":"542b67ca-d6e3-44c8-95cc-5bdb1625fd87","name":"Sticky Note"},{"parameters":{"content":"# Create Elements\\n\\n","height":680,"width":1280,"color":4},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[16,552],"id":"75466c3b-7939-4d5d-b961-0da73c785bf9","name":"Sticky Note1"},{"parameters":{"content":"# Generate Video","height":680,"width":520,"color":5},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1420,344],"id":"aee90aea-f785-4223-b2dc-fdbed5b15fa4","name":"Sticky Note2"},{"parameters":{"content":"# Upload Video","height":280,"width":1020},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[2066,416],"id":"5987e031-f839-4d3c-a3c2-b0448a16bc4f","name":"Sticky Note3"},{"parameters":{"content":"# Error","height":180,"width":700,"color":3},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1890,708],"id":"4d94755b-a17e-467a-9fbf-13de06164f36","name":"Sticky Note4"},{"parameters":{"content":"# Polling\\n","height":180,"width":700,"color":6},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[1890,940],"id":"3ff9f7c0-c67e-4be3-8898-94f6b09319b9","name":"Sticky Note5"},{"parameters":{"content":"# 🚀 Setup Guide\\n\\n**Author:** [Nate Herk](https://www.youtube.com/@nateherk)\\n\\n---\\n\\n1) **[Google Sheet Template](https://docs.google.com/spreadsheets/d/1iZn1g7gKv462eqMc4p7NEFtKXGiMql6lyWa8QRr2lSY/edit?usp=sharing)**\\n   - Make a copy and rename it\\n   - Link it to your n8n workflow via the Google Sheets node\\n\\n2) **Connect [OpenRouter Account](https://openrouter.ai/)**\\n   - Or use any other chat model provider that supports your needs\\n\\n3) **[JSON2Video](https://json2video.com/?afco=nate)**\\n   - Connect your API key\\n   - (Optional) Connect your ElevenLabs API key for voiceovers\\n   - **Image model tips:**\\n     - *Flux Schnell* and *Freepik Classic* = **Free**\\n     - *Flux Pro* = **20 credits per image**\\n\\n4) **YouTube Credential**\\n   - Set up your OAuth2 credentials to post directly to your YouTube channel\\n","height":600,"width":520},"type":"n8n-nodes-base.stickyNote","typeVersion":1,"position":[0,0],"id":"859f2708-de78-47c6-ae07-3dd5a48a5654","name":"Sticky Note6"},{"parameters":{"workflowId":{"__rl":true,"value":"hJdXYdSDA8pMnD5H","mode":"list"},"workflowInputs":{"mappingMode":"defineBelow","value":{},"matchingColumns":[],"schema":[],"attemptToConvertTypes":false,"convertFieldsToString":true},"options":{}},"type":"n8n-nodes-base.executeWorkflow","typeVersion":1.2,"position":[1168,208],"name":"Call My Sub-workflow","id":"c3320576-ec48-40ac-a3e1-342f20c357b0"}]	{"When clicking ‘Test workflow’":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Generate Video":{"main":[[{"node":"150 Secs","type":"main","index":0}]]},"Get Video":{"main":[[{"node":"Switch","type":"main","index":0}]]},"10 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Switch":{"main":[[{"node":"Created Video","type":"main","index":0}],[{"node":"Error","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}],[{"node":"10 Secs","type":"main","index":0}]]},"4o-mini":{"ai_languageModel":[[{"node":"AI Agent","type":"ai_languageModel","index":0}]]},"AI Agent":{"main":[[{"node":"Split Out","type":"main","index":0}]]},"Structured Output Parser":{"ai_outputParser":[[{"node":"AI Agent","type":"ai_outputParser","index":0}]]},"Split Out":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]},"Loop Over Items":{"main":[[],[{"node":"Call My Sub-workflow","type":"main","index":0}]]},"Google Sheets":{"main":[[{"node":"Intro & Outro","type":"main","index":0}]]},"Intro & Outro":{"main":[[{"node":"Ranker","type":"main","index":0}]]},"Intro & Outro Parser":{"ai_outputParser":[[{"node":"Intro & Outro","type":"ai_outputParser","index":0}]]},"Ranker":{"main":[[{"node":"Generate Video","type":"main","index":0}]]},"Rankings":{"ai_outputParser":[[{"node":"Ranker","type":"ai_outputParser","index":0}]]},"4o":{"ai_languageModel":[[{"node":"Intro & Outro","type":"ai_languageModel","index":0},{"node":"Ranker","type":"ai_languageModel","index":0}]]},"150 Secs":{"main":[[{"node":"Get Video","type":"main","index":0}]]},"Created Video":{"main":[[{"node":"Download Video","type":"main","index":0}]]},"Download Video":{"main":[[{"node":"YouTube","type":"main","index":0}]]},"YouTube":{"main":[[{"node":"Update Sheet","type":"main","index":0}]]},"Schedule Trigger":{"main":[[{"node":"Google Sheets","type":"main","index":0}]]},"Schedule Trigger1":{"main":[[{"node":"AI Agent","type":"main","index":0}]]},"Call My Sub-workflow":{"main":[[{"node":"Loop Over Items","type":"main","index":0}]]}}	\N	f	\N
52f79888-ec23-4c40-87b9-edb8c8c8cd71	hJdXYdSDA8pMnD5H	Jeffrey Llamas	2026-05-02 20:05:41.021+00	2026-05-02 20:05:41.021+00	[{"parameters":{"authentication":"oAuth2","resource":"sheet","operation":"create","documentId":{"__rl":true,"value":"","mode":"list","cachedResultName":"","cachedResultUrl":""},"title":"n8n-sheet","options":{}},"type":"n8n-nodes-base.googleSheets","typeVersion":4.5,"position":[1552,224],"id":"e64af857-c1a4-4c4d-8fbd-28fe29afd64a","name":"Add to Sheet","issues":{"parameters":{"documentId":["Parameter \\"Document\\" is required."]}},"credentials":{"googleSheetsOAuth2Api":{"id":"8MqVitRad5EHaynN","name":"Google Sheets account"},"googleApi":{"id":"scvHOoxKDnFxz9jf","name":"Google Sheets account 2"}},"alwaysOutputData":true,"executeOnce":true,"retryOnFail":true},{"id":"29a21ebb-8c71-4cb0-893b-90a348312221","typeVersion":1.1,"name":"Start","type":"n8n-nodes-base.executeWorkflowTrigger","position":[1344,224],"parameters":{"inputSource":"passthrough"}}]	{"Start":{"main":[[{"node":"Add to Sheet","type":"main","index":0}]]}}	\N	f	\N
b71f2957-0848-4e4c-b9fd-1631cc2eed13	1UIy7q3UXi42x3ry	Jeffrey Llamas	2026-05-02 20:05:44.222+00	2026-05-02 20:05:44.222+00	[{"id":"c055762a-8fe7-4141-a639-df2372f30060","typeVersion":1.1,"name":"When Executed by Another Workflow","type":"n8n-nodes-base.executeWorkflowTrigger","position":[260,340],"parameters":{}},{"id":"b5942df6-0160-4ef7-965d-57583acdc8aa","name":"Replace me with your logic","type":"n8n-nodes-base.noOp","position":[520,340],"parameters":{}}]	{"When Executed by Another Workflow":{"main":[[{"node":"Replace me with your logic","type":"main","index":0}]]}}	\N	f	\N
aaa76421-9104-42fe-b60e-0d8e6d20f4de	bbsdId4xX7PFvnn6	Jeffrey Llamas	2026-05-02 20:05:47.327+00	2026-05-02 20:05:47.327+00	[{"parameters":{},"id":"3941733f-a23d-402b-ab3d-32f1f3f0d6a9","name":"When clicking ‘Test workflow’","type":"n8n-nodes-base.manualTrigger","position":[368,1552],"typeVersion":1},{"parameters":{"url":"=https://queue.fal.run/fal-ai/veo3/requests/{{ $('Create Video').item.json.request_id }}/status ","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","options":{}},"id":"b66a0e84-845a-4739-9ca2-f2dd97b5a8de","name":"Get status","type":"n8n-nodes-base.httpRequest","position":[1440,1552],"typeVersion":4.2},{"parameters":{"amount":60},"id":"667a3af5-08dc-4b05-a5f9-76d24f0d64cc","name":"Wait 60 sec.","type":"n8n-nodes-base.wait","position":[1248,1552],"webhookId":"490facb8-d0ae-402e-ab59-a87720cf0bdd","typeVersion":1.1},{"parameters":{"rule":{"interval":[{"field":"minutes"}]}},"id":"81e4cec5-85a8-476e-9813-70e7cf85129c","name":"Schedule Trigger","type":"n8n-nodes-base.scheduleTrigger","position":[368,1408],"typeVersion":1.2},{"parameters":{"content":"# Generate AI Videos with Google Veo3, Save to Google Drive and Upload to YouTube\\n\\nThis workflow allows users to **generate AI videos** using **Google Veo3**, save them to **Google Drive**, generate optimized YouTube titles with GPT-4o, and **automatically upload them to YouTube** . The entire process is triggered from a Google Sheet that acts as the central interface for input and output.\\n\\nIT automates video creation, uploading, and tracking, ensuring seamless integration between Google Sheets, Google Drive, Google Veo3, and YouTube.\\n\\n\\n\\n\\n","height":280,"width":740,"color":3},"id":"9f6296c0-f1f5-4984-b94d-cc160ab37cbf","name":"Sticky Note3","type":"n8n-nodes-base.stickyNote","position":[368,240],"typeVersion":1},{"parameters":{"content":"## STEP 1 - GOOGLE SHEET\\nCreate a [Google Sheet like this](https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=sharing).\\n\\nPlease insert:\\n- in the \\"PROMPT\\" column the accurate description of the video you want to create\\n- in the \\"DURATION\\" column the lenght of the video you want to create\\n\\nLeave the \\"VIDEO\\" column unfilled. It will be inserted by the system once the video has been created","height":200,"width":740},"id":"9f6fa130-128d-4171-9fc7-78d800008580","name":"Sticky Note4","type":"n8n-nodes-base.stickyNote","position":[368,560],"typeVersion":1},{"parameters":{"conditions":{"options":{"caseSensitive":true,"leftValue":"","typeValidation":"strict","version":2},"combinator":"and","conditions":[{"id":"383d112e-2cc6-4dd4-8985-f09ce0bd1781","operator":{"name":"filter.operator.equals","type":"string","operation":"equals"},"leftValue":"={{ $json.status }}","rightValue":"COMPLETED"}]},"options":{}},"id":"0e20e92c-55b2-4e44-a519-2ee54b1b8c69","name":"Completed?","type":"n8n-nodes-base.if","position":[1616,1552],"typeVersion":2.2},{"parameters":{"operation":"update","documentId":{"__rl":true,"mode":"list","value":"1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=drivesdk","cachedResultName":"Video Google Veo3"},"sheetName":{"__rl":true,"mode":"list","value":"gid=0","cachedResultUrl":"https://docs.google.com/spreadsheets/d/11ebWJvwwXHgvQld9kxywKQUvIoBw6xMa0g0BuIqHDxE/edit#gid=0","cachedResultName":"Foglio1"},"columns":{"value":{"VIDEO":"={{ $('Get Url Video').item.json.video.url }}","row_number":"={{ $('Get new video').item.json.row_number }}"},"schema":[{"id":"PROMPT","type":"string","display":true,"removed":false,"required":false,"displayName":"PROMPT","defaultMatch":false,"canBeUsedToMatch":true},{"id":"DURATION","type":"string","display":true,"removed":false,"required":false,"displayName":"DURATION","defaultMatch":false,"canBeUsedToMatch":true},{"id":"VIDEO","type":"string","display":true,"removed":false,"required":false,"displayName":"VIDEO","defaultMatch":false,"canBeUsedToMatch":true},{"id":"YOUTUBE_URL","type":"string","display":true,"removed":false,"required":false,"displayName":"YOUTUBE_URL","defaultMatch":false,"canBeUsedToMatch":true},{"id":"row_number","type":"string","display":true,"removed":false,"readOnly":true,"required":false,"displayName":"row_number","defaultMatch":false,"canBeUsedToMatch":true}],"mappingMode":"defineBelow","matchingColumns":["row_number"],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"id":"d46e0303-eb0b-4d4f-9bf9-c61e1d577265","name":"Update result","type":"n8n-nodes-base.googleSheets","position":[1456,1808],"typeVersion":4.5},{"parameters":{"assignments":{"assignments":[{"id":"c713d31f-9abd-496a-ac79-e8e2efe60aa0","name":"prompt","type":"string","value":"={{ $json.PROMPT }}\\n\\nDuration of the video: {{ $json.DURATION }}"}]},"options":{}},"id":"4954542f-171a-4eb3-a038-7c941052a770","name":"Set data","type":"n8n-nodes-base.set","position":[816,1552],"typeVersion":3.4},{"parameters":{"content":"## STEP 4 - MAIN FLOW\\nStart the workflow manually or periodically by hooking the \\"Schedule Trigger\\" node. It is recommended to set it at 5 minute intervals.","height":100,"width":740},"id":"e8db1b31-21fa-4b1e-9c98-eeb965a82af1","name":"Sticky Note5","type":"n8n-nodes-base.stickyNote","position":[368,1232],"typeVersion":1},{"parameters":{"content":"## STEP 2 - GET API KEY (YOURAPIKEY)\\nCreate an account [here](https://fal.ai/) and obtain API KEY.\\nIn the node \\"Create Image\\" set \\"Header Auth\\" and set:\\n- Name: \\"Authorization\\"\\n- Value: \\"Key YOURAPIKEY\\"","height":140,"width":740},"id":"2d1603f0-8c89-4fe7-b058-7e22c9cf9bfb","name":"Sticky Note6","type":"n8n-nodes-base.stickyNote","position":[368,800],"typeVersion":1},{"parameters":{"content":"Set API Key created in Step 2","height":200,"width":180},"id":"4ec2b087-e0ae-49ab-9ba2-cd7e3d5563ef","name":"Sticky Note7","type":"n8n-nodes-base.stickyNote","position":[992,1488],"typeVersion":1},{"parameters":{"documentId":{"__rl":true,"mode":"list","value":"1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=drivesdk","cachedResultName":"Video Google Veo3"},"sheetName":{"__rl":true,"mode":"list","value":"gid=0","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit#gid=0","cachedResultName":"Foglio1"},"filtersUI":{"values":[{"lookupColumn":"VIDEO"}]},"options":{}},"id":"a8314ad2-949f-476d-92e9-9408fcf20463","name":"Get new video","type":"n8n-nodes-base.googleSheets","position":[592,1552],"typeVersion":4.5},{"parameters":{"method":"POST","url":"https://queue.fal.run/fal-ai/veo3","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendHeaders":true,"headerParameters":{"parameters":[{"name":"Content-Type","value":"application/json"}]},"sendBody":true,"specifyBody":"json","jsonBody":"={\\n     \\"prompt\\": \\"{{$json.prompt}}\\"\\n}","options":{}},"id":"c0aca14a-194e-4cec-aaed-084e78486a36","name":"Create Video","type":"n8n-nodes-base.httpRequest","position":[1040,1552],"typeVersion":4.2},{"parameters":{"url":"=https://queue.fal.run/fal-ai/veo3/requests/{{ $json.request_id }}","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","options":{}},"id":"64990394-1d99-470a-82db-42174c59ac95","name":"Get Url Video","type":"n8n-nodes-base.httpRequest","position":[368,1920],"typeVersion":4.2},{"parameters":{"url":"={{ $('Get Url Video').item.json.video.url }}","options":{}},"id":"8fddedcd-1d0b-43c9-8001-1b006ff02451","name":"Get File Video","type":"n8n-nodes-base.httpRequest","position":[992,1920],"typeVersion":4.2},{"parameters":{"name":"={{ $now.format('yyyyLLddHHmmss') }}-{{ $('Get Url Video').item.json.video.file_name }}","driveId":{"__rl":true,"mode":"list","value":"My Drive"},"folderId":{"__rl":true,"mode":"list","value":"1aHRwLWyrqfzoVC8HoB-YMrBvQ4tLC-NZ","cachedResultUrl":"https://drive.google.com/drive/folders/1aHRwLWyrqfzoVC8HoB-YMrBvQ4tLC-NZ","cachedResultName":"Fal.run"},"options":{}},"id":"abc5ec3b-dcf4-486b-9368-17216bfcaae7","name":"Upload Video","type":"n8n-nodes-base.googleDrive","position":[1280,1808],"typeVersion":3},{"parameters":{"method":"POST","url":"https://api.upload-post.com/api/upload","authentication":"genericCredentialType","genericAuthType":"httpHeaderAuth","sendBody":true,"contentType":"multipart-form-data","bodyParameters":{"parameters":[{"name":"title","value":"={{ $('Generate title').item.json.message.content }}"},{"name":"user","value":"YOUR_USERNAME"},{"name":"platform[]","value":"youtube"},{"parameterType":"formBinaryData","name":"video","inputDataFieldName":"data"}]},"options":{}},"id":"afeac8db-be1b-422b-9c2d-de150083de90","name":"HTTP Request","type":"n8n-nodes-base.httpRequest","position":[1280,2032],"typeVersion":4.2},{"parameters":{"modelId":{"__rl":true,"mode":"list","value":"gpt-4o-mini","cachedResultName":"GPT-4O-MINI"},"messages":{"values":[{"content":"=Input: {{ $('Get new video').item.json.PROMPT }}"},{"content":"You are a YouTube SEO expert specialized in creating engaging and optimized titles.\\n\\nYour task is to generate an effective title for a YouTube video based on the user's video description.\\n\\nGUIDELINES:\\n- Maximum 60 characters to avoid truncation\\n- Use relevant keywords for SEO\\n- Make the title catchy and clickable\\n- Avoid excessive or misleading clickbait\\n- Consider the target audience of the content\\n- Use numbers, questions, or power words when appropriate\\n- IMPORTANT: Generate the title in the same language as the input description\\n\\nOUTPUT FORMAT:\\nProvide only the title, without additional explanations.\\n\\nEXAMPLE:\\nInput: \\"Tutorial video on how to cook perfect pasta carbonara\\"\\nOutput: \\"PERFECT Carbonara in 10 Minutes - Chef's Secrets\\"","role":"system"}]},"options":{}},"id":"0328a4d1-198b-4ae0-a27e-5e9a39b6a5c3","name":"Generate title","type":"@n8n/n8n-nodes-langchain.openAi","position":[608,1920],"typeVersion":1.8},{"parameters":{"operation":"update","documentId":{"__rl":true,"mode":"list","value":"1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ","cachedResultUrl":"https://docs.google.com/spreadsheets/d/1pcoY9N_vQp44NtSRR5eskkL5Qd0N0BGq7Jh_4m-7VEQ/edit?usp=drivesdk","cachedResultName":"Video Google Veo3"},"sheetName":{"__rl":true,"mode":"list","value":"gid=0","cachedResultUrl":"https://docs.google.com/spreadsheets/d/11ebWJvwwXHgvQld9kxywKQUvIoBw6xMa0g0BuIqHDxE/edit#gid=0","cachedResultName":"Foglio1"},"columns":{"value":{"VIDEO":"=","row_number":"={{ $('Get new video').item.json.row_number }}","YOUTUBE_URL":"https://youtu.be/{{ $json.results.youtube.video_id }}"},"schema":[{"id":"PROMPT","type":"string","display":true,"removed":false,"required":false,"displayName":"PROMPT","defaultMatch":false,"canBeUsedToMatch":true},{"id":"DURATION","type":"string","display":true,"removed":false,"required":false,"displayName":"DURATION","defaultMatch":false,"canBeUsedToMatch":true},{"id":"VIDEO","type":"string","display":true,"removed":false,"required":false,"displayName":"VIDEO","defaultMatch":false,"canBeUsedToMatch":true},{"id":"YOUTUBE_URL","type":"string","display":true,"removed":false,"required":false,"displayName":"YOUTUBE_URL","defaultMatch":false,"canBeUsedToMatch":true},{"id":"row_number","type":"string","display":true,"removed":false,"readOnly":true,"required":false,"displayName":"row_number","defaultMatch":false,"canBeUsedToMatch":true}],"mappingMode":"defineBelow","matchingColumns":["row_number"],"attemptToConvertTypes":false,"convertFieldsToString":false},"options":{}},"id":"32ef6c52-e7c8-46bd-94dc-9a68c1b64a9f","name":"Update Youtube URL","type":"n8n-nodes-base.googleSheets","position":[1456,2032],"typeVersion":4.5},{"parameters":{"content":"Set YOUR_USERNAME in Step 3","height":200,"width":180},"id":"3c92c864-b015-42c8-92d1-44c6826346db","name":"Sticky Note","type":"n8n-nodes-base.stickyNote","position":[1248,1968],"typeVersion":1},{"parameters":{"content":"## STEP 3 - Upload video on Youtube\\n- Find your API key in your [Upload-Post Manage Api Keys](https://www.upload-post.com/?linkId=lp_144414&sourceId=n3witalia&tenantId=upload-post-app) 10 FREE uploads per month\\n- Set the the \\"Auth Header\\":\\n-- Name: Authorization\\n-- Value: Apikey YOUR_API_KEY_HERE\\n- Create profiles to manage your social media accounts. The \\"Profile\\" you choose will be used in the field YOUR_USRNAME (eg. test1 or test2).  ","height":200,"width":740},"id":"caa2ae49-c800-4403-9ef0-88403b466d69","name":"Sticky Note8","type":"n8n-nodes-base.stickyNote","position":[368,992],"typeVersion":1},{"parameters":{"content":"## MY NEW YOUTUBE CHANNEL\\n👉 [Subscribe to my new **YouTube channel**](https://youtube.com/@n3witalia). Here I’ll share videos and Shorts with practical tutorials and **FREE templates for n8n**.\\n\\n[![image](https://n3wstorage.b-cdn.net/n3witalia/youtube-n8n-cover.jpg)](https://youtube.com/@n3witalia)","height":736,"width":736,"color":7},"id":"573eb0dc-69ee-4707-a054-1fe6eaf6449d","name":"Sticky Note9","type":"n8n-nodes-base.stickyNote","position":[1152,592],"typeVersion":1}]	{"Set data":{"main":[[{"node":"Create Video","type":"main","index":0}]]},"Completed?":{"main":[[{"node":"Get Url Video","type":"main","index":0}],[{"node":"Wait 60 sec.","type":"main","index":0}]]},"Get status":{"main":[[{"node":"Completed?","type":"main","index":0}]]},"Create Video":{"main":[[{"node":"Wait 60 sec.","type":"main","index":0}]]},"HTTP Request":{"main":[[{"node":"Update Youtube URL","type":"main","index":0}]]},"Upload Video":{"main":[[{"node":"Update result","type":"main","index":0}]]},"Wait 60 sec.":{"main":[[{"node":"Get status","type":"main","index":0}]]},"Get Url Video":{"main":[[{"node":"Generate title","type":"main","index":0}]]},"Get new video":{"main":[[{"node":"Set data","type":"main","index":0}]]},"Generate title":{"main":[[{"node":"Get File Video","type":"main","index":0}]]},"Get File Video":{"main":[[{"node":"Upload Video","type":"main","index":0},{"node":"HTTP Request","type":"main","index":0}]]},"When clicking ‘Test workflow’":{"main":[[{"node":"Get new video","type":"main","index":0}]]}}	\N	f	\N
\.


--
-- Data for Name: workflow_publish_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_publish_history" ("id", "workflowId", "versionId", "event", "userId", "createdAt") FROM stdin;
\.


--
-- Data for Name: workflow_published_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_published_version" ("workflowId", "publishedVersionId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: workflow_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflow_statistics" ("count", "latestEvent", "name", "workflowId", "rootCount", "id", "workflowName") FROM stdin;
1	2026-05-01 22:48:04.21+00	data_loaded	4PeZJJxDMiJE6tcE	1	5	\N
1	2026-05-01 23:34:25.767+00	manual_success	nv4NgSzjmvBxdIjO	0	7	Top 10 Videos
8	2026-05-02 09:50:20.606+00	manual_error	4PeZJJxDMiJE6tcE	0	3	Top 10 Videos
10	2026-05-02 15:32:28.456+00	manual_success	4PeZJJxDMiJE6tcE	0	1	Top 10 Videos
3	2026-05-02 16:00:34.238+00	manual_error	nv4NgSzjmvBxdIjO	0	21	Top 10 Videos
1	2026-05-02 17:26:47.832+00	manual_success	aHPyQ2bgeu7Ilrbd	0	28	Top 10 Videos
10	2026-05-02 19:57:44.902+00	manual_error	aHPyQ2bgeu7Ilrbd	0	24	Top 10 Videos
2	2026-05-05 05:35:00.989+00	manual_error	7JoImKafB7kqtzgS	0	35	Top 10 Videos
\.


--
-- Data for Name: workflows_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."workflows_tags" ("workflowId", "tagId") FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets_analytics" ("name", "type", "format", "created_at", "updated_at", "id", "deleted_at") FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets_vectors" ("id", "type", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata", "metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."vector_indexes" ("id", "name", "bucket_id", "data_type", "dimension", "distance_metric", "metadata_configuration", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."auth_provider_sync_history_id_seq"', 1, false);


--
-- Name: credential_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."credential_dependency_id_seq"', 1, false);


--
-- Name: execution_annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."execution_annotations_id_seq"', 1, false);


--
-- Name: execution_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."execution_entity_id_seq"', 35, true);


--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."execution_metadata_temp_id_seq"', 1, false);


--
-- Name: insights_by_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."insights_by_period_id_seq"', 1, false);


--
-- Name: insights_metadata_metaId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."insights_metadata_metaId_seq"', 1, false);


--
-- Name: insights_raw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."insights_raw_id_seq"', 1, false);


--
-- Name: instance_version_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."instance_version_history_id_seq"', 1, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."migrations_id_seq"', 166, true);


--
-- Name: oauth_user_consents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."oauth_user_consents_id_seq"', 1, false);


--
-- Name: secrets_provider_connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."secrets_provider_connection_id_seq"', 1, false);


--
-- Name: user_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_favorites_id_seq"', 2, true);


--
-- Name: workflow_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."workflow_dependency_id_seq"', 3281, true);


--
-- Name: workflow_publish_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."workflow_publish_history_id_seq"', 1, false);


--
-- Name: workflow_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."workflow_statistics_id_seq"', 36, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict hiqxPDGonEv8Gd200FRJU6zwa8iEAGxjidjwf0FYcUmB92elXpsDmSFFChvphWR

RESET ALL;
