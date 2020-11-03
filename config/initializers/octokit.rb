# Enable automatic paging to concatinates page results for a single call
# without specifying page params

Octokit.configure do |c|
  c.auto_paginate = true
end
