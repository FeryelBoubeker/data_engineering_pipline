import subprocess
import time

# the subprocess module allows us to run shell commands from Python code (like the posgress-client commands)


def wait_for_database(host)->bool:
    '''
        Check if The database is ready
    '''
    retries = 5
    while retries > 0:
        try:
            result= subprocess.run(["pg_isready", "-h", host], check=True, capture_output=True, text=True)
            if "accepting connections" in result.stdout:
                print(f"the Database {host}is ready")
                return True     
        except subprocess.CalledProcessError as e:
            print(f"the checking command failed: {e}")
            retries -=1
            if retries == 0:
                print(f"failed to connect to {host}exiting ")
                return False
            print("Retrying again ...")
            time.sleep(1)
    return False       

if not wait_for_database("postgresql_source"):
    exit(1)
if not wait_for_database("postgresql_destination"):
    exit(1)   

print("Starting the ELT script ...")

# postgresql_source config
source_config ={
    'host': "postgresql_source",
    'U': "postgres",
    'd': "postgres",
}


# postgresql_destination config
destiantion_config ={
    'host': "postgresql_destination",
    'U': "postgres",
    'd': "postgres",
}

# the Dump command 
dump_command = [
    "pg_dump", 
    "-h", source_config['host'], 
    "-U", source_config['U'], 
    "-d", source_config['d'],
    "-f", "dump.sql", 
    "-w"
]

subprocess_env = {"PGPASSWORD": "password"}

subprocess.run(dump_command, env=subprocess_env, check=True)

load_command = [
    "psql", 
    "-h", destiantion_config['host'], 
    "-U", destiantion_config['U'], 
    "-d", destiantion_config['d'],
    "-a", "-f", "dump.sql", 
    "-w"
]

subprocess.run(load_command, env=subprocess_env, check=True)

print("Ending the Elt script Succusfully")