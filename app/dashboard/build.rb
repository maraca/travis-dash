require 'travis'

module Dashboard
  class DashboardBuild

    def initialize(endpoint, auth_token)
      @client = Travis::Client.new(endpoint)
      @client.github_auth(auth_token)
    end

    def get_builds(projects)
      builds = {}
      projects.each do |project|
        begin
          repo = @client.repo(project)
          build = repo.last_build
          commit = build.commit
          builds[project] = { 'author' => commit.author_name,
                              'email' => commit.author_email,
                              'url' => commit.compare_url,
                              'state' => build.state,
                            }
        rescue Travis::Client::NotFound => error
          puts "#{project} does not exist. Verify path."
        end
      end
      builds
    end

  end
end
