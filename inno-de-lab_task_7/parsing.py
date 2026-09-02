# initialize data
db_config = {
    "connection": {
        "host": "production-db.internal",
        "port": 5432,
        "user": "postgres"
    }
}

# get connections from db_config
connections: dict = db_config.get("connection", {})

# get host and port
host = connections.get("host", "host is missing")
port = connections.get("port", "port is missing")

# check user in connections before updating
if connections.get("user") is not None:
    connections["user"] = "admin"

# get ssl_mode from connections
ssl_mode = connections.get("ssl_settings", {}).get("ssl_mode", "verify-full")

# create field max_connections in connections
connections["max_connections"] = 100

# format to string ssl_mode
ssl_mode = f"SSL Mode: {ssl_mode}"

# print final result
print(ssl_mode)
print("Параметры соединения: ")
for key, value in connections.items():
    print(f"* {key}: {value}")


