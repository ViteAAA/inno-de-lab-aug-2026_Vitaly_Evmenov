# library for pretty output
import json


# initialized data
system_telemetry = [
    ("srv_01", 12.5, 64, "online"),
    ("srv_02", 85.0, 92, "online"),
    ("srv_03", 0.0, 0, "offline"),
    ("srv_04", 45.2, 78, "online"),
    ("srv_05", 95.1, 99, "online")
]

# lists with active data
active_names = []
active_cpu = []
active_mem = []

# result dictionary
result_dict = {}

# loop for find all data
for node_name, cpu_load, ram_usage, status in system_telemetry:
    if status != "online":
        continue

    active_names.append(node_name)
    active_cpu.append(cpu_load)
    active_mem.append(ram_usage)

# set active_nodes_count field in result dictionary
result_dict["active_nodes_count"] = len(active_names)

# set metrics field in result dictionary
result_dict.update({
    "metrics": {
        "average_cpu": sum(active_cpu) / len(active_cpu),
        "max_ram": max(active_mem),
    }
})

# output result data
print(f"Активные узлы в сети:  {active_names}")
print("Итоговый отчет телеметрии: ")
pretty_output = json.dumps(result_dict, indent=4)
print(pretty_output.replace('"', "'"))
