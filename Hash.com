Console.WriteLine("Blocked with HASH={0} successfully mined!", Hash);
    }
    public string CreateHash()
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            string rawData = PreviousHash + _timeStamp + Transactions + _nonce;
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
            return Encoding.Default.GetString(bytes);
