# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains the French translation of "Mastering Ethereum" by Andreas M. Antonopoulos and Dr. Gavin Wood. The book is published as a Jekyll static site at ethereum.maitriser.ca using GitHub Pages.

## Common Development Commands

### Jekyll Site Development
```bash
# Install Jekyll dependencies (from docs/ directory)
cd docs/
bundle install

# Serve Jekyll site locally for development
cd docs/
bundle exec jekyll serve

# Build Jekyll site for production
cd docs/
bundle exec jekyll build
```

### Site Management
```bash
# View site locally (after running serve)
# http://localhost:4000

# Deploy to GitHub Pages (automatic on push to main branch)
git push origin main
```

## Architecture

### Repository Structure
This is a Jekyll-based documentation site with the following key directories:
```
/LivreMaitriserEthereum/
├── docs/                    # Jekyll site root
│   ├── _config.yml         # Site configuration
│   ├── Gemfile             # Ruby dependencies
│   ├── _layouts/           # Jekyll page templates
│   ├── _includes/          # Reusable components
│   ├── _sass/              # Custom SCSS styles
│   ├── html/               # Pre-generated book content
│   │   ├── book.html       # Complete book as single page
│   │   └── for_use_*       # Individual chapter HTML files
│   └── assets/             # Images and static files
├── _config.yml             # GitHub Pages theme config (slate)
└── README.md               # Repository documentation
```

### Content Architecture
- **Source Content**: Pre-generated HTML files in `docs/html/`
- **Complete Book**: Available as single page at `docs/html/book.html`
- **Chapter Files**: Individual chapters as `for_use_ethereumbook_*_fr_CA.html`
- **Site Theme**: Uses Jekyll Minima theme with custom styling
- **Deployment**: Automatic GitHub Pages deployment from `docs/` directory

### Translation Context
- **Original**: "Mastering Ethereum" by Andreas M. Antonopoulos & Dr. Gavin Wood
- **Translation**: French (Quebec) using Grand dictionnaire terminologique (GDT)
- **Translator**: Serafim Dos Santos
- **Process**: Initial Google Translate API via Transifex, then manual revision

### Domain Configuration
- **Production Site**: ethereum.maitriser.ca
- **GitHub Pages**: Deployed from `docs/` directory
- **CNAME**: Configured for custom domain

### Jekyll Configuration
- **Theme**: Minima 2.5+ with custom styling in `_sass/minima/`
- **Plugins**: jekyll-feed, jekyll-seo-tag
- **Ruby Version**: Managed via Gemfile
- **Build**: Automatic on GitHub Pages, manual via `bundle exec jekyll build`

## Content Guidelines

### File Organization
- HTML content files are pre-generated and stored in `docs/html/`
- Images are located in `docs/html/images/` maintaining original naming
- Jekyll layouts and includes provide consistent site structure
- Custom CSS extends Minima theme via `_sass/minima/` directory

### Development Workflow
1. Make changes to Jekyll templates, styles, or configuration in `docs/`
2. Test locally using `bundle exec jekyll serve`
3. Commit and push changes to trigger GitHub Pages deployment
4. Content HTML files are typically not edited directly (pre-generated)

### Site Customization
- Custom styles in `docs/_sass/minima/custom-styles.scss`
- Site variables in `docs/_sass/minima/custom-variables.scss`
- Page templates in `docs/_layouts/`
- Reusable components in `docs/_includes/`