# Service Interfaces Module

## About

The [Foundation](https://github.com/robmllze/foundation) template is divided into several modules. This helps separate concerns and makes it easier to manage the codebase.

This is the Foundation's Service Interfaces Module and declares the communication and data exchange patterns for the front-end.

It comprises of the following:

- **External Invokers**: Invokers for cloud functions outside the system.
- **Internal Invokers**: Invokers for functions within the system, such as cloud-based functions.
- **App Interfaces**: Abstract classes that contribute to the structural framework of the app.
- **Agnostic Interfaces**: Abstract classes that facilitate generic communication with back-end services.
- **Service Environment**: A container class for all essential back-end services.

## Notes

- Rename `_service_interfaces-foundation` to `_service_interfaces` before using it in your project.
- This module is designed to aid in the structuring of the front-end. It should not rely on any specialized packages and must remain as generic as possible.
