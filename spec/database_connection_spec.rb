require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end
  describe '.connection' do
    it 'this connection is persistent' do
    # Grab the connection as a return value from the .setup method
      connection = DatabaseConnection.setup('chitter_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end
  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM cheets;")

      DatabaseConnection.query("SELECT * FROM cheets;")
    end
  end
end
