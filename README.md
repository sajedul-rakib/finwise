# Finwise

A Flutter project for personal finance management.

## About the Project

Finwise is a mobile application built with Flutter that helps users track their income and expenses, manage their budget, and gain insights into their spending habits. The app provides a user-friendly interface to manage financial data and visualize it through charts and graphs.

## Architecture

This project follows a feature-based architecture, where the code is organized by features. This approach promotes modularity, scalability, and ease of maintenance. The core components and features are separated into their own modules, making the codebase clean and understandable.

### Key Architectural Features:
*   **Feature-based module separation:** Code is organized into directories based on application features like `login`, `signup`, `transactions`, `analysis`, etc.
*   **Core components:** Shared widgets, services, and utilities are placed in a `core` directory to be reused across different features.
*   **Clear separation of concerns:** Each feature module encapsulates its own UI, business logic, and data, reducing dependencies between modules.

## Features

*   User authentication (login, signup)
*   Onboarding screens
*   Dashboard/Home screen
*   Transaction management (add, edit, view)
*   Expense and income tracking
*   Financial analysis with charts
*   Category management for transactions
*   User profile management
*   Push notifications
*   Customer service and help section

## Dependencies

The project utilizes the following key dependencies:

*   **`google_fonts`**: For custom fonts.
*   **`pinput`**: For OTP/PIN input fields.
*   **`fl_chart`**: For beautiful and customizable charts.
*   **`intl`**: For internationalization and localization.
