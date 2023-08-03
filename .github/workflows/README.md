| Workflow Name | Trigger | Purpose |
| --- | --- | --- |
| Content Validation | Push, Pull Request | Run Spectacles to Validate Looker Content (i.e., no orphaned Looks/Tiles/Explores) |
| docker-image.yml | Push, Pull Request | Build Latest Spectacles Docker Container Image |
| greetings.yml | Create Issue, Pull Request | Message "Welcome" upon first GitHub Issue or Pull Request |
| label.yml | Pull Request | Apply label depending on path specification |
| lookml_validation.yml | Push, Pull Request | Validate LookML Code |
| release.yml | Push | Create a Release |
| salesforce_mirantis_sql_validation.yml | Push, Pull Request | Spectacles checks Explores for SQL errors |
| stale.yml | Cron Daily | Clean up Stale PRs |
| tag.yml | Push | Tag push against Main |
