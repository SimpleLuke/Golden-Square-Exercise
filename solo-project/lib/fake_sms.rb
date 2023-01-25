class FakeSMS
  Message = Struct.new(:from, :to, :body)

  # attr_accessor :messages
  # self.messages = []

  def initialize(_account_sid, _auth_token)
    @messages = []
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    # self.class.messages << Message.new(from: from, to: to, body: body)
    @messages << body
  end
end
