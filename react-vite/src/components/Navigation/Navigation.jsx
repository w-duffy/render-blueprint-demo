import { NavLink } from "react-router-dom";
import ProfileButton from "./ProfileButton";
import "./Navigation.css";

function Navigation() {
  return (
    <ul>
      <li>
        <NavLink to="/">yessss</NavLink>
      </li>

      <li>
        <ProfileButton />
      </li>
            </ul>
  );
}

export default Navigation;
