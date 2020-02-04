puts "THIS IS OUR GITHUB AUTHENTICATION LOGIC."
puts "!!! YOU SHOULD STORE YOUR KEY AND SECRET IN AN ENVIRONMENT HASH IN ORDER TO PROTECT YOUR KEY AND SECRET FROM OTHERS (SO THEY CANT STEAL IT AND START AUTHENTICATING WITH MY APP WITH MY CREDENTIALS) !!!"

# use OmniAuth::Builder do
# 	provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
# 	provider :github, '228d30fe51c5b5432ef9', '3eeaad1beb4570f0afffebe83c33e2c9f650200d'
# end

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github, '228d30fe51c5b5432ef9', '3eeaad1beb4570f0afffebe83c33e2c9f650200d'
end