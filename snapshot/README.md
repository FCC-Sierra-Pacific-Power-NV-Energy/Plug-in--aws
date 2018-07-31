# Snapshot Plug-in Workflow Step Package
# vCommander Supported Build Version 1006050089

This package contains a collection of vCommander plug-in workflow steps for managing VMware snapshots on Windows. 

It can be used in the vCommander workflow extension scenario *Patching Windows VMs*, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home). It can also be used outside of vCommander scenarios. 

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Create Snapshot
+ Delete Snapshot
+ Revert Snapshot

## Create Snapshot

**Purpose:** Creates a new snapshot.

**Inputs:** 

- Input field for Snapshot name
- Input field for Snapshot description (optional)
- Checkbox for Capture Memory
- Checkbox for Quiesce Filesystem

See the vCenter Client documentation for more information on these fields.

## Delete Snapshot

**Purpose:** Deletes the latest snapshot with a given name

**Inputs:**
- Input field for Snapshot name 

## Revert Snapshot

**Purpose:** Reverts to the latest snapshot with a given name

**Inputs:**
- Input field for Snapshot name 

## Installation

Plug-in workflow steps are supported with vCommander release 7.0 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

<vcommander-install>\tomcat\common\classes\log4j2.xml 

**General Utilities**

- Loggers:
  - `<Logger level="DEBUG" name="plugin.snapshot"/>`