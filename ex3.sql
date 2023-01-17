DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;


# ---------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS connections;
CREATE TABLE connections (
    id SERIAL, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    user_id BIGINT UNSIGNED NOT NULL,
    friend_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (friend_id) REFERENCES users(id)
);



DROP TABLE IF EXISTS community_post;
CREATE TABLE community_post (
    id SERIAL, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_name_community BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_name_community) REFERENCES communities_name_idx(name)
);

DROP TABLE IF EXISTS community_members;
CREATE TABLE community_members (
    id SERIAL, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    member_id BIGINT UNSIGNED NOT NULL,
    name_community BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (name_community) REFERENCES communities_name_idx(name)
# ---------------------------------------------------------------------------------------------------------