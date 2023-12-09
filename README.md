# Dart Order App

Welcome to the Dart Order App! This app allows users to order coffee and manage their purchases seamlessly.

## Features

- **Welcome Screen**: A user-friendly introduction to the app.
- **Thanks Page**: Expresses gratitude to users and acknowledges their interactions.
- **Basket Page**: Facilitates order management with total price calculation.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Dart SDK [Install Dart](https://dart.dev/get-dart)

### Installing

1. Clone the repository:

   ```bash
   git clone https://github.com/abdulra7ma/order_app_mobile_app.git
   cd dart-order-app 
   ```

1. Install dependencies:
```bash
dart pub get
```

### Running the App
To run the Dart Order App, use the following command:
```bash
dart run
```

Visit http://localhost:3000 in your web browser to access the app.

### Backend Repository
For the backend functionality, the Django app repository is available at Dart Order App Backend. Follow the instructions below to set up and run the Django app:
1. Clone the backend repository:
```bash
git clone https://github.com/abdulra7ma/dart-order-app-backend.git
cd dart-order-app-backend
```
2. Install dependencies:
```bash
pip install -r requirements.txt
```
3. Apply migrations:
```bash
python manage.py migrate
```
4. Run the development server:
```bash
python manage.py runserver
```

Visit http://localhost:8000 to interact with the Django app.

### Contributing
If you'd like to contribute to this project, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature (git checkout -b feature/new-feature).
3. Commit your changes (git commit -am 'Add new feature').
4. Push to the branch (git push origin feature/new-feature).
5. Create a new pull request.
