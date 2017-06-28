namespace Sirela.Shared
{
    public static class CuitValidator
    {
        public static bool Validate(string cuit)
        {
            if (cuit == null)
            {
                return false;
            }
            
            cuit = cuit.Replace("-", string.Empty);
            if (cuit.Length != 11)
            {
                return false;
            }
            else
            {
                var calculado = CalcularDigitoCuit(cuit);
                var digito = int.Parse(cuit.Substring(10));
                return calculado == digito;
            }
        }

        private static int CalcularDigitoCuit(string cuit)
        {
            int[] mult = new[] { 5, 4, 3, 2, 7, 6, 5, 4, 3, 2 };
            char[] nums = cuit.ToCharArray();
            int total = 0;
            for (int i = 0; i < mult.Length; i++)
            {
                total += int.Parse(nums[i].ToString()) * mult[i];
            }
            var resto = total % 11;

            return resto == 0 ? 0 : resto == 1 ? 9 : 11 - resto;
        }
    }
}