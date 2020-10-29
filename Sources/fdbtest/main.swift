import FDB
import Logging
import struct Foundation.Date

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

CustomLogger.logLevel = .trace
LoggingSystem.bootstrap(CustomLogger.init)
let logger = Logger(label: "default")
FDB.logger = logger

logger.info("Creating FDB")
let fdb = FDB()
logger.info("Created FDB")

logger.info("Connecting")
try fdb.connect()
logger.info("Connected")

let key = "TMP_TEST"

logger.info("Setting")
try fdb.set(key: key, value: "lulkek \(Date())".bytes)
logger.info("Set")

logger.info("Getting")
dump(try fdb.get(key: key)?.string)
logger.info("Got")

logger.info("Bye")
