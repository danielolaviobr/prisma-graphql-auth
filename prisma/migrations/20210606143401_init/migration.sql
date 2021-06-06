-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Tokens" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "token" TEXT NOT NULL,
    "usersId" TEXT NOT NULL,
    FOREIGN KEY ("usersId") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Users.email_unique" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Tokens.token_unique" ON "Tokens"("token");
