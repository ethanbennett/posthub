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

        expect(repositories.first[:owner][:login]).to eq("ethanbennett")
        expect(repository).to have_key(:id)
        expect(repository).to have_key(:name)
        expect(repository).to have_key(:full_name)
        expect(repository).to have_key(:owner)
        expect(repository).to have_key(:commits_url)
      end
    end
  end
end