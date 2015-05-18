from Fursuiter.authentication import create_valid_session, LoginRequired

from distill.renderers import renderer


class GalleryController(object):

	def fetchUserGallery(self,userId):
		pass

	# Sample gallery. Referenced images are not included.
	def fetchSampleGallery(self):
		return [
			{
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Rechner Fox",
				"user": "rechner",
				"path":"/static/img/10406649_1588609514747720_4838286247390758166_n.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Copper Badger",
				"user": "copperbadger",
				"path":"/static/img/10495823_1083353961681059_4409386730279998239_o.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "insomnicon",
				"user": "insomnicon",
				"path":"/static/img/10991575_976494769057535_685125727056801111_o.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Rechner Fox",
				"user": "rechner",
				"path":"/static/img/11246034_1429478784036873_1510883555187956795_n.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Jack Tail",
				"user": "jacktail",
				"path":"/static/img/1370436540.jacktail_img_6610.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Copper Badger",
				"user": "copperbadger",
				"path":"/static/img/1370436761.jacktail_img_6794.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Jack Tail",
				"user": "jacktail",
				"path":"/static/img/1370436906.jacktail_img_5119.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Mankeulv Coyote",
				"user": "mankeulv",
				"path":"/static/img/1370437231.jacktail_img_6824.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Jack Tail",
				"user": "jacktail",
				"path":"/static/img/1370437396.jacktail_img_6839.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Jack Tail",
				"user": "jacktail",
				"path":"/static/img/1370437834.jacktail_img_6882.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Mankeulv Coyote",
				"user": "mankeulv",
				"path":"/static/img/1370440114.jacktail_panoramic.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Jack Tail",
				"user": "jacktail",
				"path":"/static/img/1405609275.copperbadger_img_0541.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Dreae Otter",
				"user": "dreae",
				"path":"/static/img/1405609896.copperbadger_img_0551.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Dreae Otter",
				"user": "dreae",
				"path":"/static/img/1428155722.animosus5_17028645172_e226bb0630_k.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Dreae Otter",
				"user": "dreae",
				"path":"/static/img/1430354161.foxalbiazul_fwa2015-loboloc0-02.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Dreae Otter",
				"user": "dreae",
				"path":"/static/img/1431554059.havik_17335463525_326a9c9233_k.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Copper Badger",
				"user": "copperbadger",
				"path":"/static/img/1tbeF1a.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "Rechner Fox",
				"user": "rechner",
				"path":"/static/img/ari-toony.jpg"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "insomnicon",
				"user": "insomnicon",
				"path":"/static/img/Capture.png"
			}, {
				"title": "Untitled Image",
				"edate": "16 May 2015",
				"description": "Lorem ipsum dolor sit amit...",
				"ruser": "insomnicon",
				"user": "insomnicon",
				"path":"/static/img/img_6394.jpg"
			}
		]

	@renderer('gallery/gallery.mako')
	def GET_sampleGallery(self, request, response):
		return {"images": self.fetchSampleGallery()}