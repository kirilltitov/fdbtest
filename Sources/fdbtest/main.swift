import FDB

extension String {
    var bytes: Bytes {
        Bytes(self.utf8)
    }
}

extension Bytes {
    var string: String {
        String(bytes: self, encoding: .utf8)!
    }
}

let fdb = FDB()
try fdb.connect()

let key = "TMP_TEST"
try fdb.set(key: key, value: "lulkek".bytes)
dump(try fdb.get(key: key)?.string)
