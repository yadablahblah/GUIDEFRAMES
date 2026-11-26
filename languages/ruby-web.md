# Ruby Web

Loaded when the target is a website/web service and the AI chooses Ruby.
Instructions to the AI.

## Stack

- **Runtime**: Ruby 3.3+.
- **Framework**: Rails (preferred) or Sinatra for small services.
- **Build**: Bundler.
- **Testing**: RSpec (or Minitest).

## Layout

```
app/
├── controllers/
├── models/
├── services/
config/
spec/  or  test/
Gemfile
```

## Rules

- Validate and sanitise all input; use strong parameters.
- Use ActiveRecord parameterisation (no raw string SQL).
- Escape output; set security headers + CSP.
- Secrets via `credentials`/env, never in source.
- HTTPS in production.

## Quality gates

```
bundle install
bundle exec rspec       # or rake test
bundle exec rubocop     # if configured
bundle exec brakeman    # security scan, if available
```

All must pass before reporting completion (see `universal/testing.md`).

## SEO

Load `seo.md` if the site is public and should be indexed.

## Packaging

See `packaging/web-deploy.md`.