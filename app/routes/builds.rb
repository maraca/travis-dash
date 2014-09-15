module Dashboard
  module Routes
    class Builds < Base

      get '/builds' do
        content_type :json

        builds = DashboardBuild.new(settings.travis, settings.github_token)
        builds.get_builds(settings.projects).to_json
      end
    end
  end
end
