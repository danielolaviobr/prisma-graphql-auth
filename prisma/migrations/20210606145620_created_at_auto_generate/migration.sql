-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Users" ("createdAt", "email", "id", "password") SELECT "createdAt", "email", "id", "password" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
CREATE UNIQUE INDEX "Users.email_unique" ON "Users"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
