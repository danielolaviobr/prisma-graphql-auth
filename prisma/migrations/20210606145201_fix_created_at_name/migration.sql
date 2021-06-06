/*
  Warnings:

  - You are about to drop the column `createAt` on the `Users` table. All the data in the column will be lost.
  - Added the required column `createdAt` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL
);
INSERT INTO "new_Users" ("email", "id", "password") SELECT "email", "id", "password" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
CREATE UNIQUE INDEX "Users.email_unique" ON "Users"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
