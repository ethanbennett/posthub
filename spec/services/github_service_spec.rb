require 'rails_helper'

describe GithubService do
  context ".account_info" do
    it "returns relevant account information" do
      VCR.use_cassette("github_service_account_info") do
        account_info = GithubService.account_info("ethanbennett")

        expect(account_info).to be_a(Hash)
        expect(account_info.count).to eq(30)
        expect(account_info).to have_key(:login)
        expect(account_info).to have_key(:name)
        expect(account_info).to have_key(:blog)
        expect(account_info).to have_key(:location)
        expect(account_info).to have_key(:email)
        expect(account_info).to have_key(:hireable)
        expect(account_info).to have_key(:bio)
      end
    end
  end

  context ".repositories" do
    it "returns a list of all user repositories" do
      VCR.use_cassette("github_service_repositories") do
        repositories = GithubService.repositories("ethanbennett")
        
        expect(repositories).to be_an(Array)
        repository = repositories.first

        expect(repository[:owner][:login]).to eq("ethanbennett")
        expect(repository).to have_key(:id)
        expect(repository).to have_key(:name)
        expect(repository).to have_key(:full_name)
        expect(repository).to have_key(:owner)
        expect(repository).to have_key(:commits_url)
      end
    end
  end

    context ".recent_activity" do
    it "returns a list of the user's recent activity" do
      VCR.use_cassette("github_service_recent_activity") do
        activity = GithubService.recent_activity("ethanbennett")
        
        expect(activity).to be_an(Array)
        most_recent = activity.first

        expect(most_recent).to have_key(:id)
        expect(most_recent).to have_key(:type)
        expect(most_recent).to have_key(:actor)
        expect(most_recent).to have_key(:repo)
        expect(most_recent).to have_key(:payload)
      end
    end
  end

  context ".following" do
    it "returns a list of people the user follows" do
      VCR.use_cassette("github_service_following") do
        following = GithubService.following("ethanbennett")
        
        expect(following).to be_an(Array)
      end
    end
  end

  context ".organizations" do
    it "returns a list of the user's organizations" do
      VCR.use_cassette("github_service_organizations") do
        organizations = GithubService.organizations("ethanbennett")
        
        expect(organizations).to be_an(Array)
      end
    end
  end
end