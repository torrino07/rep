INSERT INTO bots.Users (email, hashed_password, is_mfa_enabled, role)
VALUES
    ('torrino07@gmail.com', '$2b$12$SD8OzVnPPp2B6nm.URwhEeS5U/JExeklmdU.e9BT5Q.I3ul0JErXa', FALSE, 'admin')
ON CONFLICT (email) DO NOTHING;
