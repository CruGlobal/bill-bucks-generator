# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Bill Bucks Generator is a Rails 7.0.7 application that generates fun virtual "Bill Bucks" - custom currency images with personalized messages that can be sent via email. It's an internal tool for Cru that creates PNG images of fake bills with customizable "To", "From", and "For" messages.

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
bundle exec standard --fix  # Auto-fix Ruby code style issues
bundle exec brakeman       # Run security scanner
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

- Datadog APM integration
- Rollbar error tracking
- Custom Ougai logger configuration
- Health check endpoint at `/monitors/lb`

## Important Notes

- Currently on Rails 7.0.7, with upgrade to 7.1 planned (see RAILS_UPGRADE_PROMPT.txt)
- Ruby 3.2.8 required
- PostgreSQL database
- Docker deployment using Alpine Linux
- ImageMagick dependency for image generation
- Supervisor manages processes in production