class ServerConfiguration {
    constructor(host, port) {
        this.host = host || 'localhost';
        this.port = port || 3000;
    }

    toString() {
        return `listening on http://${this.host}:${this.port}`;
    }
}

module.exports = ServerConfiguration;