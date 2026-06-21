Next-Gen SOC



Building the next generation of SOC operations: automated, AI-assisted, and detection-driven.



This repository is a collection of tools, detection rules, and automation workflows built from over 12 years of hands-on experience in Security Operations Centers. Every project here addresses a real operational gap I've encountered — from detecting kernel-level threats to automating alert triage.



\---



What You'll Find Here



| Directory | Purpose |

|-----------|---------|

| `tools/` | Standalone security tools for threat detection and analysis |

| `sigma-rules/` | Custom Sigma detection rules mapped to MITRE ATT\&CK |

| `playbooks/` | SOC automation playbooks and integration scripts |

| `ai-experiments/` | Prototypes using AI/LLM for security operations |

| `assets/` | Architecture diagrams, screenshots, and supporting visuals |



\---



Projects



\### Driver Threat Hunter



Detect BYOVD (Bring Your Own Vulnerable Driver) attacks.



Attackers load signed-but-vulnerable drivers to gain kernel access. EDRs miss them because they're signed. This scanner-analyzer duo enumerates all loaded Windows drivers, checks signatures, and flags suspicious ones.



\*\*MITRE:\*\* T1068, T1543.003, T1562.001



→ \[View Project](tools/driver-threat-hunter/)



\---



Sigma Rules



Custom detection rules mapped to MITRE ATT\&CK.



→ \[View Rules](sigma-rules/)



| Rule | MITRE | Description |

|------|-------|-------------|

| \[BYOVD Driver Load](sigma-rules/byovd-driver-load.yml) | T1068, T1543.003, T1562.001 | Detects loading of known vulnerable drivers |





More tools and detection content are in development.



\---

Author



Morteza Hosseinabadi

Security Operations \& Automation Specialist  

12+ years in enterprise SOC environments  

\[LinkedIn](www.linkedin.com/in/morteza-hosseinabadi-07b8903a)





