import Foundation

extension NSInputStream {
    func readByteArray(len: Int) -> [UInt8] {
        var readBuffer = Array<UInt8>(count:len, repeatedValue: 0)
        let numberOfBytesRead = self.read(&readBuffer, maxLength: readBuffer.count)
        assert(numberOfBytesRead == len)
        return readBuffer
    }
    
    func readNSData(len: Int) -> NSData {
        return NSData(bytes: readByteArray(len), length: len)
    }
    
    func readCharsAsString(len: Int) -> String {
        return String(data: readNSData(len), encoding: NSUTF8StringEncoding)!
    }
    
    func readType<T>(_: T.Type) -> T {
        let buffer = readByteArray(sizeof(T))
        return UnsafePointer<T>(buffer).memory
    }
}
