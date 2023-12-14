import { createBrowserRouter } from 'react-router-dom';
import LoginFormPage from '../components/LoginFormPage';
import SignupFormPage from '../components/SignupFormPage';

import AboutMePage from '../components/AboutMe';
import Counter from '../components/Counter';

import Layout from './Layout';

export const router = createBrowserRouter([
  {
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <AboutMePage />,
      },
      {
        path: "login",
        element: <LoginFormPage />,
      },
      {
        path: "signup",
        element: <SignupFormPage />,
      },
      {
        path: "about-me",
        element: <AboutMePage />,
      },
      {
        path: "counter",
        element: <Counter />,
      },
      {
        path: "*",
        element: <h1>Not Found</h1>,
      }
    ],
  },
]);
