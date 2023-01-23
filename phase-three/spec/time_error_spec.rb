require 'time_error'

describe TimeError do
  it 'returns difference in seconds between server time and local machine time' do
    requester = double :requester
    expect(requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"2a01:4b00:8096:1100:1d44:e4fe:64c4:c2da","datetime":"2023-01-23T21:52:08.174229+00:00","day_of_week":1,"day_of_year":23,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1674510728,"utc_datetime":"2023-01-23T21:52:08.174229+00:00","utc_offset":"+00:00","week_number":4}')

    time = Time.new(2022,1,23,22,22,22,'+00:00')
    time_error = TimeError.new(requester)
    result = time_error.error(time)
    expect(result).to eq 31534186.174229
  end
end
