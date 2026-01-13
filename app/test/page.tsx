import { getAllBrands } from "../lib/queries";

export default async function TestPage() {
  const brands = await getAllBrands();

  console.log(brands);

  return (
    <pre>{JSON.stringify(brands, null, 2)}</pre>
  );
}
