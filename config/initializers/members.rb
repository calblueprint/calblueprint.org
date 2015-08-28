# load members.yml into memcache
Rails.cache.write('members.yml', YAML.load_file(Rails.root.join('data', 'members.yml')))
