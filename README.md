# Netflix-Style Movie Web Application

Full-stack movie app with authentication, OMDB search, and favorites. Built with React (Vite), Node.js, Express, MongoDB, JWT, and Tailwind CSS.

## Folder Structure

```
Netflix Project/
├── client/                 # React frontend (Vite)
│   ├── public/
│   ├── src/
│   │   ├── api/            # API helpers
│   │   ├── components/
│   │   ├── context/        # Auth context
│   │   ├── hooks/
│   │   └── pages/
│   ├── index.html
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.js
├── server/                 # Node.js backend
│   ├── config/
│   ├── middleware/
│   ├── models/
│   ├── routes/
│   ├── utils/
│   ├── .env.example
│   ├── index.js
│   └── package.json
└── README.md
```

## Prerequisites

- **Node.js** (v18+)
- **MongoDB** (local or MongoDB Atlas connection string)

## Environment Setup

### 1. Server

```bash
cd server
cp .env.example .env
```

Edit `server/.env`:

- `PORT` – Server port (default: 5000)
- `MONGODB_URI` – MongoDB connection string (e.g. `mongodb://localhost:27017/netflix-movies` or Atlas URI)
- `JWT_SECRET` – Strong random string for signing JWTs (change in production)
- `OMDB_API_KEY` – OMDB API key (default provided: `daaf6ce3`)
- `YOUTUBE_API_KEY` – YouTube Data API v3 key used for trailer lookup
- `CLIENT_URL` – Frontend URL (default: `http://localhost:5173`)

### 2. Client

The client uses Vite’s proxy so API calls to `/api` go to the backend. No `.env` is required for local dev.

## How to Run

### Install dependencies

```bash
# Backend
cd server
npm install

# Frontend (from project root)
cd client
npm install
```

### Start MongoDB

Make sure MongoDB is running locally, or use a cloud URI in `server/.env`.

### Start backend

```bash
cd server
npm run dev
```

Server runs at **http://localhost:5000**.

### Start frontend

```bash
cd client
npm run dev
```

App runs at **http://localhost:5173**.

Open **http://localhost:5173** in the browser. Sign up, log in, then use the dashboard to search movies and manage your list.

## Features

- **Auth**: Sign up (full name, email, password with validation), login, logout. JWT in HTTP-only cookie; protected routes.
- **Dashboard**: Hero section, debounced search, horizontal movie rows, load more (pagination).
- **Trailer preview**: `Preview Trailer` button on movie cards, autoplay YouTube modal, and fallback search link when no trailer is found.
- **Movie detail**: Title, year, runtime, rating, plot, director, actors, “Add to My List”.
- **Favorites**: Stored in MongoDB; view and remove from My List.
- **UI**: Dark Netflix-style theme (black/red), Tailwind, responsive, basic animations.

## API Overview

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/signup` | Register |
| POST | `/api/auth/login` | Login |
| POST | `/api/auth/logout` | Logout |
| GET | `/api/auth/me` | Current user (protected) |
| GET | `/api/movies/search?q=&page=1` | Search OMDB |
| GET | `/api/movies/trailer?title=movie+name` | Resolve first YouTube trailer |
| GET | `/api/movies/:id` | Movie by IMDB ID |
| GET | `/api/favorites` | User favorites (protected) |
| POST | `/api/favorites` | Add favorite (protected) |
| DELETE | `/api/favorites/:imdbID` | Remove favorite (protected) |

## Production Notes

- Set `NODE_ENV=production`.
- Use a strong `JWT_SECRET` and keep it secret.
- Use HTTPS and set `secure: true` for cookies if needed.
- Build client: `cd client && npm run build` and serve the `dist` folder or use your host’s static hosting.
