raw_user_record = input("Please enter your user record: ")
# split string by separator
sorted_data = raw_user_record.split(";")

# flag for validation
valid_flag = True

# function for formating uid
def format_uid(uid):
    new_uid = int(uid)
    if not str(new_uid) == uid:
        return None
    return f"UHD-{new_uid}"

# function for formating fullname
def format_fullname(fullname):
    if not isinstance(fullname, str):
        return None
    fullname = fullname.title()
    fullname = fullname.replace("_", " ")
    return fullname

# function for formating city
def format_city(city):
    if not isinstance(city, str):
        return None
    return city.upper()

# function for formating status
def format_status(status):
    if not isinstance(status, str):
        return None
    return status.lower()

# list with links to functions
function_list = [
    format_uid,
    format_fullname,
    format_city,
    format_status,
]

# delete spaces and format data
new_collection = []
for index, data in enumerate(sorted_data):
    data = data.strip()
    data = function_list[index](data)

    if data is None:
        break

    new_collection.append(data)


normalize_user_record = raw_user_record

# check is valid data?
if valid_flag:
    sorted_data = " | ".join(new_collection)
    print(f"Нормализованная запись: {sorted_data}")
else:
    print("incorrect data")


