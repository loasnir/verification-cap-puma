# frozen_string_literal: true

set :bundle_without, 'production'
set :bundle_flags, '--deployment --quiet'

server 'verification-cap-puma', roles: %w[app db web], batch: true

set :puma_threads, [0, 2]
