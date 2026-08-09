# WP-CLI on a remote site
instawp wp <site> plugin list
instawp wp <site> option get siteurl

# Pass raw args to WP-CLI with --
instawp wp <site> -- post list --post_type=page --format=json

# eval / PHP payloads — wrap in single quotes; args are shell-escaped for you
instawp wp <site> eval '\MyClass::init(["force" => true]);'

# Escape hatch for non-WP commands
instawp exec <site> ls -la
instawp exec <site> cat wp-config.php

# --api transport (no SSH setup required; works behind firewalls / in CI)
instawp wp <site> option get siteurl --api
instawp exec <site> php -v --api
export INSTAWP_TOKEN=${{ secrets.INSTAWP_TOKEN }}

# Create a preview site for a PR
instawp create --name "pr-$PR_NUMBER" --json

# Run a smoke test
instawp wp "pr-$PR_NUMBER" option get siteurl --api

# Clean up
instawp sites delete "pr-$PR_NUMBER" --force