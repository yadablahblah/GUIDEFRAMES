# PHP Web

Loaded when the target is a website/web service and the AI chooses PHP.
Instructions to the AI.

## Stack

- **Runtime**: PHP 8.3+.
- **Framework**: Laravel (preferred) or Symfony; plain PHP for tiny scripts.
- **Build**: Composer.
- **Testing**: PHPUnit.

## Layout

```
app/
├── Http/Controllers/
├── Models/
├── Services/
routes/
tests/
composer.json
```

## Rules

- Validate and sanitise all input; never trust request data.
- Use parameterised queries / Eloquent (no string-concatenated SQL).
- Escape output to prevent XSS; set security headers + CSP.
- Secrets in `.env` (git-ignored), never in source.
- Use HTTPS in production.

## Quality gates

```
composer install
vendor/bin/phpunit
vendor/bin/phpstan analyse   # if configured
vendor/bin/pint --test       # formatting
```

All must pass before reporting completion (see `universal/testing.md`).

## SEO

Load `seo.md` if the site is public and should be indexed.

## Packaging

See `packaging/web-deploy.md`.