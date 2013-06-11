warn "set ENV['AWS_ACCESS_KEY_ID']" unless ENV['AWS_ACCESS_KEY_ID']
warn "set ENV['AWS_SECRET_KEY']" unless ENV['AWS_SECRET_KEY']

Amazon::Ecs.options = {
  :associate_tag => 'mallowlabs-22' || ENV['ASSOCIATE_TAG'],
  :AWS_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :AWS_secret_key => ENV['AWS_SECRET_KEY']
}
