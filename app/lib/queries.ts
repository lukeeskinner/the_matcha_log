import { prisma } from "./prisma";

export async function getAllBrands() {
    return prisma.matchaBrand.findMany({
        include:{
        products: true,
        },
        orderBy: {
            name:"asc"
        },
    });
}