
module.exports = {
	"get /hello": function (req, res) {
		/**
		 * Say hello page
		 * @author fed
		 */
		this.render.ftl("hello", {
			name: "world "
		});
	},
	"get /card/index": function(req, res) {
		/**
		 * test override in freemarker
		 */
		this.render.ftl("card/index");
	}
};