import "reflect-metadata";
import { ApolloServer } from "apollo-server";
import { buildSchema } from "type-graphql";
import { context } from "./context";
import { UserResovler } from "./UserResolver";

const app = async () => {
	const schema = await buildSchema({ resolvers: [UserResovler] });

	new ApolloServer({ schema, context }).listen({ port: 4000 }, () =>
		console.log("Server is runnig 🚀")
	);
};

app();
