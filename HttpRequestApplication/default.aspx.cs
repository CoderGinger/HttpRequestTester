using System;
using System.Net;
using System.Net.Http;
using System.Web.UI;

namespace HttpRequestApplication
{
    public partial class Default : Page
    {

        public async void ButtonTestUrl_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBoxUrl.Text)) return;

            SetTlsVersion();

            try
            {
                var client = GetClient();
                
                DivResponse.Visible = true;
                using (var response = await client.GetAsync(TextBoxUrl.Text))
                using (var content = response.Content)
                {
                    if (response.IsSuccessStatusCode)
                    {
                        SpanResponse.InnerHtml = "OK";
                        return;
                    }

                    SpanResponse.InnerHtml = await content.ReadAsStringAsync();
                }
            }
            catch (Exception ex)
            {
                var certificateBypassMessage = string.Empty;

                if (DropDownTls.SelectedValue == "2" || DropDownTls.SelectedValue == "3")
                {
                    certificateBypassMessage = @" <strong>TLS 1.1 or TLS 1.2 was used but connection failed. Please try to use bypass certificate error option.</strong>";
                }
                SpanResponse.InnerHtml = ex.InnerException == null ? ex.Message + certificateBypassMessage : ex.InnerException.Message + certificateBypassMessage;
            }
        }

        private void SetTlsVersion()
        {
            switch (DropDownTls.SelectedValue)
            {
                case "1":
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;
                    break;
                case "2":
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls11;
                    break;
                case "3":
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    break;
            }
        }

        private HttpClient GetClient()
        {
            var requestHandler = new WebRequestHandler();

            if (CheckBoxBypassCertificateErrors.Checked)
            {
                requestHandler.ServerCertificateValidationCallback += (sender, cert, chain, sslPolicyErrors) => true;
            }

            return new HttpClient(requestHandler);
        }
    }
}