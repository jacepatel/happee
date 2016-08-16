Rspec.describe Team, type: :model do
  let(:team) { Team.new }
  let(:slack_response) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'slack_auth_response.json')).read }

  describe '#create_or_update_from_slack' do
    subject { team.create_or_update_from_slack(slack_response) }
    context 'when pull_request_fail is true then is should fail' do
      it {
        binding.pry
        expect(team.uid).to not_eq(nil) }
    end
  end
