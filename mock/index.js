
module.exports = {
	"get /hello": function (req, res) {
		/**
		 * Say hello page
		 * @author fed
		 */
		this.render.ftl("hello", {
			name: "world  "
		});
	},
	"get /": function(req, res) {
		/**
		 * test override in freemarker
		 */
		this.render.ftl("portal/index");
	}
};