# initialized data
# user
requested_roles = ["guest", "developer", "guest", "admin", "developer", "guest"]
#admin
required_admin_roles = {"admin", "security_officer", "audit_manager"}

# create unique set from requested roles
unique_set = set(requested_roles)
print(f"Уникальные запрошенные роли: {unique_set}")

# find intersections between unique_set and required_admin_roles
united_admin_roles = unique_set.intersection(required_admin_roles)
print(f"Общие административные роли: {united_admin_roles}")

# find intersections between required_admin_roles and unique_set
not_included_admin_roles = required_admin_roles.difference(unique_set)
print(f"Недостающие административные роли: {not_included_admin_roles}")

# check including security_officer in united_admin_roles
print(f"Наличие роли security_officer в запросе: {'security_officer' in united_admin_roles}")
