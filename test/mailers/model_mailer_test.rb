require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "oder_notification" do
    mail = ModelMailer.oder_notification
    assert_equal "Oder notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
