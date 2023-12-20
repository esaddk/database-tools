```markdown
# MongoDB Replica Set Initialization Script

## Overview

This script automates the process of converting a standalone MongoDB instance into a replica set. It performs the following tasks:

1. Generates a keyFile for internal authentication.
2. Stops the MongoDB service.
3. Modifies the MongoDB configuration file (`mongod.conf`) to enable replication and sets up keyFile and replica set parameters.
4. Restarts the MongoDB service.
5. Checks MongoDB login every 10 seconds until successful.
6. Initializes the replica set with a specified name and member.
7. Checks the replica set status.

## Prerequisites

- MongoDB installed on the server.
- Permissions to modify MongoDB configuration and stop/start the service.
- Basic knowledge of MongoDB authentication.

## Usage

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/esaddk/database-tools.git
   ```

2. **Navigate to the Script Directory:**

   ```bash
   cd mongodb/convert-singlenode-to-replicaset/
   ```

3. **Update Script Variables:**

   Open the script (`convert-to-rs.sh`) in a text editor and update the following variables:
   - `REPLICA_SET_NAME`: Specify the desired replica set name.
   - `USERNAME`: MongoDB user with sufficient privileges.
   - `PASSWORD`: Password for the specified MongoDB user.

4. **Run the Script:**

   ```bash
   chmod +x convert-to-rs.sh
   ./convert-to-rs.sh
   ```

   Follow the prompts and wait for the script to complete. Ensure you have the necessary permissions to stop/start the MongoDB service.

5. **Review Logs:**

   Check the logs generated by the script for any errors or important information:


## Important Notes

- Ensure you have backups of your MongoDB data and configuration before running the script.
- Review log files for any errors or unexpected behavior.
- Test the script in a safe environment before applying it to production.

## Contributing

Feel free to contribute to the script by submitting issues or pull requests on the [GitHub repository](https://github.com/esaddk/database-tools.git).

## License

This script is licensed under the [MIT License](LICENSE).
```