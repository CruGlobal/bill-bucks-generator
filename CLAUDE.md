# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Bill Bucks Generator is a Rails 7.1 application that generates fun virtual "Bill Bucks" - custom currency images with personalized messages that can be sent via email. It's an internal tool for Cru that creates PNG images of fake bills with customizable "To", "From", and "For" messages.

## Common Commands

### Development Setup
```bash
bin/setup                    # Initial setup: installs dependencies, prepares database
bin/rails server            # Start development server
```

### Testing
```bash
bundle exec rspec           # Run all tests
bundle exec rspec spec/controllers/bucks_controller_spec.rb  # Run specific test file
```

### Code Quality & Security
```bash
bundle exec standardrb --fix  # Auto-fix Ruby code style issues
bundle exec brakeman --ensure-latest -A -q --no-pager  # Run security scanner
bundle exec bundle audit check --update  # Check for gem vulnerabilities
```

### Docker Build
```bash
bin/local-docker-build     # Build Docker image locally
```

## Architecture Overview

### Core Models

**Buck** (`app/models/buck.rb`): 
- Generates PNG images using RMagick
- Two types: regular bills (worth 1) and "vonettes" (worth 5)
- Department-specific variants (IRT gets different images)
- Implements text wrapping for long messages

**BuckWad** (`app/models/buck_wad.rb`):
- Collection of Buck objects
- Optimizes bill count into bills and vonettes
- Handles pagination for multiple bills

### Key Controllers

**BucksController** (`app/controllers/bucks_controller.rb`):
- `new`: Display form
- `generate`: Create bills and optionally send email
- `img`: Serve generated images
- Email restricted to logged-in users sending to @cru.org addresses

**LoginController** (`app/controllers/login_controller.rb`):
- Okta OAuth authentication
- Custom OAuth implementation in `app/lib/okta_oauth.rb`

### Authentication & Security

- Okta OAuth for user authentication
- Email validation restricts sending to @cru.org addresses only
- Session-based tracking of bills generated (resets quarterly)

### Image Generation

- Uses RMagick to generate PNG images
- Four templates: bill.png, vonette.png, cap.png, mag.png (in `app/assets/images/`)
- Custom font: love.ttf
- Dynamic text positioning and wrapping based on message length

### Email System

- BillMailer sends generated bills as attachments
- Only authenticated users can send emails
- Validates recipient has @cru.org email address

### Frontend

- Rails Import Maps (no webpack)
- Bootstrap 5.3.1 for styling
- Turbo Rails for SPA-like interactions
- Custom JavaScript in `app/assets/javascripts/generator.js`

### Monitoring & Logging

- Datadog APM integration (v2.17.0)
- Rollbar error tracking
- Custom Ougai logger configuration via Log::Logger
- Health check endpoint at `/monitors/lb`
- Application logs sent to stdout for Docker/Datadog integration

## Important Notes

- Rails 7.1.5.1 (upgraded from 7.0.7)
- Ruby 3.3.5 required
- PostgreSQL database
- Docker deployment using Alpine Linux
- ImageMagick dependency for image generation (requires PKG_CONFIG_PATH for installation)
- Supervisor manages processes in production
- Puma 6.x web server (upgraded from 5.x for Rack 3 compatibility)
- RSpec 6.x for testing (upgraded for Rails 7.1 compatibility)