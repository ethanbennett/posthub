require 'rails_helper'

describe GithubService do
  context ".account_info" do
    it "returns relevant account information" do
      VCR.use_cassette("github_service_account_info") do
        account_info = GithubService.account_info("ethanbennett")
        # Don't test for specific data
        # Specific keys are a good idea
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
end